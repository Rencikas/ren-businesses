local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('ren-businesses:can:craft:item', function(source, cb, data)
    local pData = QBCore.Functions.GetPlayer(source)

    for k,v in pairs(data.craft) do 
        local item = exports['qb-inventory']:HasItem(source, v.item, v.count)

        if item then 
            cb(true)
        end

    end
    cb(false)
end)

RegisterNetEvent('ren-business:craft:item', function(data)
    local pData = QBCore.Functions.GetPlayer(source)

    for k,v in pairs(data.craft) do 
        local item = exports['qb-inventory']:HasItem(source, v.item, v.count)

        if item then 
            pData.Functions.RemoveItem(v.item, v.count)
            pData.Functions.AddItem(data.item, 1)
            
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[v.item], "remove", v.count) 
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[data.item], "add", 1)
        end
        
    end
end)