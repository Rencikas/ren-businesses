local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('ren-businesses:can:craft:item', function(source, cb, data)
    local pData = QBCore.Functions.GetPlayer(source)

    if HasCraftItems(source, data.required) then
        return cb(true)
    end

    cb(false)
end)

RegisterNetEvent('ren-business:craft:item', function(data)
    local pData = QBCore.Functions.GetPlayer(source)

    if HasCraftItems(source, data.required) then         

        for k,v in pairs(data.required) do
            pData.Functions.RemoveItem(k, v)                
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[k], "remove", v) 
        end   
        
        for k,v in pairs(data.result) do
            pData.Functions.AddItem(k, v)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[k], "add", v)   
        end 
        TriggerClientEvent('QBCore:Notify', source, 'Crafting process was successfull!', 'success')
    end
end)

HasCraftItems = function(src, items)
    local pData = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(items) do
        local item = pData.Functions.GetItemByName(k)
    
        if not item then return false end
    
        if item.amount < v then return false end
    end

    return true
end