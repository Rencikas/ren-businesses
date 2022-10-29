local QBCore = exports['qb-core']:GetCoreObject()
local Bills = {}  

QBCore.Functions.CreateCallback('ren-businesses:create:bill', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source).PlayerData   

    if not Bills[data.job] or not Bills[data.job][data.register] then 
        cb(true)
    else
        cb(false)    
    end
end)

RegisterNetEvent("ren-businesses:create:bill:server", function(data)
    local pData = QBCore.Functions.GetPlayer(source)

    if not pData.PlayerData.job.name == data.job then return end

    Bills[data.job] = {
        [data.register] = {
            biller = pData.PlayerData.citizenid,
            price = data.price,
            reason = data.reason
        }
    }

    TriggerClientEvent('QBCore:Notify', source, "Bill succesfully created!", "primary", 5000)
end)

QBCore.Functions.CreateCallback('ren-businesses:is:bill:created', function(source, cb, data)
    local pData = QBCore.Functions.GetPlayer(source)
    if Bills[data.business] then 

        if Bills[data.business][data.register] then 
            cb(true, Bills[data.business][data.register])
        end

    else 
        cb(false, nil)
    end
end)

RegisterNetEvent('ren-business:pay:bills', function(data)
    local bill = Bills[data.job][data.register]
    local pData = QBCore.Functions.GetPlayer(source)
    local dWorker = QBCore.Functions.GetPlayerByCitizenId(bill.biller)
    local bCut, wCut = CutPayOut(bill)

    if pData.Functions.RemoveMoney(data.type, bill.price, bill.reason) then 

        dWorker.Functions.AddMoney("bank", wCut)
        exports['qb-management']:AddMoney(data.job, bCut)

        TriggerClientEvent('QBCore:Notify', source, "You paid the bill", "primary", 5000)
        TriggerClientEvent('QBCore:Notify', dWorker.PlayerData.source, "Player has payed your bill", "primary", 5000)
        Bills[data.job][data.register] = nil        
    else 
        TriggerClientEvent('QBCore:Notify', source, "You can't afford to pay this bill", "error", 5000)
    end 
end)

RegisterNetEvent('ren-business:clear:bill', function(data)
    local pData = QBCore.Functions.GetPlayer(source)

    if not pData.PlayerData.job.name == data.job then return end

    Bills[data.job][data.register] = nil
end)

CutPayOut = function(bill)
    local business = math.floor(bill.price - bill.price * Config.PayoutSplit)    
    local worker = math.floor(bill.price - business)

    if not Config.AlowCuts then 
        business = 0
        worker = bill.price
    end

    return business, worker
end