local QBCore = exports['qb-core']:GetCoreObject()
local Bills = {}  

QBCore.Functions.CreateCallback('ren-businesses:can:create:bill', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source).PlayerData

    if not Bills[data.job..data.register] then 
        return cb(true)
    end
    
    cb(false)   
end)

RegisterNetEvent("ren-businesses:create:bill:server", function(data)
    local pData = QBCore.Functions.GetPlayer(source)

    if not pData.PlayerData.job.name == data.job then return end

    Bills[data.job..data.register] = {
        biller = pData.PlayerData.citizenid,
        price = data.price,
        reason = data.reason
    }

    TriggerClientEvent('QBCore:Notify', source, "Bill successfully created!", "success", 6000)
end)

QBCore.Functions.CreateCallback('ren-businesses:is:bill:created', function(source, cb, data)
    local pData = QBCore.Functions.GetPlayer(source)

    if Bills[data.business..data.register] then return cb(true) end
    
    cb(false)
end)

QBCore.Functions.CreateCallback('ren-businesses:get:bill:data', function(source, cb, data)
    local pData = QBCore.Functions.GetPlayer(source)

    if Bills[data.business..data.register] then return cb(Bills[data.business..data.register]) end
    
    cb(false)
end)

RegisterNetEvent('ren-business:pay:bills', function(data)
    local bill = Bills[data.job..data.register]
    local pData = QBCore.Functions.GetPlayer(source)
    local dWorker = QBCore.Functions.GetPlayerByCitizenId(bill.biller)
    local cut = CutPayOut(bill.price) 

    if pData.Functions.RemoveMoney(data.type, bill.price, bill.reason) then 

        if Config.AlowCuts then 
            exports['qb-management']:AddMoney(data.job, cut)
            dWorker.Functions.AddMoney("bank", math.floor(bill.price - cut))
        else 
            dWorker.Functions.AddMoney("bank", bill.price)
        end

        TriggerClientEvent('QBCore:Notify', source, "You have paid the bill!", "success", 6000)
        TriggerClientEvent('QBCore:Notify', dWorker.PlayerData.source, "Player has payed your bill", "success", 6000)
        Bills[data.job..data.register] = nil        
    else 
        TriggerClientEvent('QBCore:Notify', source, "You can't afford to pay this bill", "error", 6000)
    end 
end)

RegisterNetEvent('ren-business:clear:bill', function(data)
    local pData = QBCore.Functions.GetPlayer(source)

    print(json.encode(data))
    if not pData.PlayerData.job.name == data.job then return end

    if Bills[data.job..data.register] then 
        Bills[data.job..data.register] = nil
    end
end)

CutPayOut = function(price)
    value = tonumber(price)
    percent = tonumber(Config.PayoutSplit)
    if not value and not percent then return end
    return math.floor(value * (percent / 100))
end