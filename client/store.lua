local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ren-businesses:open:store', function(data)
    local StoreItems = {
        label = "Ingredient store",
        slots = 30,
        items = {}
    }

    local item = 1

    for k,v in pairs(Config.businesses[data.job]['Store'][data.store].items) do
        for i = 1, #v.authorizedJobGrades do
            if v.authorizedJobGrades[i] == QBCore.Functions.GetPlayerData().job.grade.level then
                StoreItems.items[item] = v
                StoreItems.items[item].slot = item
                item = item + 1
            end
        end
    end
    
    TriggerServerEvent("inventory:server:OpenInventory", "shop", data.job..data.store, StoreItems)
end)