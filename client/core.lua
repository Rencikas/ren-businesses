local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for k,v in pairs(Config.businesses) do 

        if v.Blip then 	   

            local blip = AddBlipForCoord(v.pos)
            SetBlipSprite(blip, v.id)
            SetBlipDisplay(blip, 4)
            SetBlipColour(blip, v.color)
            SetBlipScale(blip, v.scale)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.label)
            EndTextCommandSetBlipName(blip)
        end

        if v.Storages then 
            for stash = 1, #v.Storages do 
                local poly = v.Storages[stash]
                exports['qb-target']:AddBoxZone('ren-business:storage:'..k..stash, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:storage:'..k..stash,
                    heading = poly.heading,
                    debugPoly = true,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = 'ren-business:open:storage',
                            icon = 'your-font awesome-icon',
                            label = poly.stash.label,
                            job = poly.job,
                            stash = poly.stash
                        },
                    },
                    distance = 2.0
                })
            end
        end

        if v.Register then 
            for register = 1, #v.Register do 
                local poly = v.Register[register]
                exports['qb-target']:AddBoxZone('ren-business:register:'..k..register, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:register:'..k..register,
                    heading = poly.heading,
                    debugPoly = true,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = "ren-businesses:create:bill",
                            icon = "fas fa-cash-register",
                            label = "Create a new bill",
                            job = k, 
                            register = register
                        },
                        {
                            event = "ren-businesses:delete:bill",
                            icon = "fas fa-trash",
                            label = "Delete old bill",
                            job = k,
                            business = k,
                            register = register                                   
                        },
                        {   
                            event = "ren-businesses:pay:bill",
                            icon = "fas fa-cash-register",
                            label = "Pay",    
                            business = k,
                            register = register
                        },           
                    },
                    distance = 2.0
                })
            end
        end

        if v.Craft then 
            for craft = 1, #v.Craft do 
                local poly = v.Craft[craft]
                exports['qb-target']:AddBoxZone('ren-business:craft:'..k..craft, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:craft:'..k..craft,
                    heading = poly.heading,
                    debugPoly = true,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = "ren-businesses:open:craft",
                            icon = "fas fa-cash-register",
                            label = "Craft",
                            job = k,
                            craft = craft
                        },         
                    },
                    distance = 3.0
                })
            end
        end

        if v.Outfit then 
            for outfit = 1, #v.Outfit do 
                local poly = v.Outfit[outfit]
                exports['qb-target']:AddBoxZone('ren-business:outfit:'..k..outfit, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:outfit:'..k..outfit,
                    heading = poly.heading,
                    debugPoly = true,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = "ren-businesses:open:outfits",
                            icon = "fas fa-cash-register",
                            label = "Change outfit",
                            job = k  
                        },         
                    },
                    distance = 2.0
                })
            end
        end

        if v.Duty then 
            for duty = 1, #v.Duty do 
                local poly = v.Duty[duty]
                exports['qb-target']:AddBoxZone('ren-business:duty:'..k..duty, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:duty:'..k..duty,
                    heading = poly.heading,
                    debugPoly = true,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = "ren-businesses:change:duty",
                            icon = "fa-solid fa-clipboard-user",
                            label = "Change duty",
                            job = k  
                        },         
                    },
                    distance = 2.0
                })
            end
        end

    end
end)