local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ren-businesses:open:craft', function(data)
    local menu = {
        {
            header = "Carfting table",
            isMenuHeader = true
        },
    }  
    for k, v in pairs(Config.businesses[data.job]['Craft'][data.craft].items) do
        print(json.encode(v.required))
        menu[#menu+1] = {
            header = v.label,
            txt = "Required items: "..v.requiredLabel.."$",
            icon = "fa-solid fa-drumstick-bite",
            params = {
                event = "ren-businesses:craft:item",
                args = {
                    craft = v.required,
                    item = v.item
                }
            }
        }               
    end
    menu[#menu+1] = {
        header = "< close",      
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("ren-businesses:craft:item", function(data)
    print(json.encode(data))
    QBCore.Functions.TriggerCallback('ren-businesses:can:craft:item', function(result)
        print(result)
        if not result then 
            QBCore.Functions.Notify('You don\'t have all required items to craft this item', 'error', 7500)
        else
            QBCore.Functions.Progressbar('name_here', 'Crafting...', 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'anim@gangops@facility@servers@',
                anim = 'hotwire',
                flags = 16,
            }, {}, {}, function() 
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent('ren-business:craft:item', data)
            end, function()
                ClearPedTasks(PlayerPedId())
            end)
        end
    end, data)
end)