RegisterNetEvent("ren-business:open:storage", function(data)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", data.stash.name, {
        maxweight = data.stash.weight,
        slots = data.stash.slots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", data.stash.name)
end)