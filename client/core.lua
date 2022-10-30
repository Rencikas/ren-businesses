local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for k,v in pairs(Config.businesses) do 

        if v.Blip then 	  
            for Blip = 1, #v.Blip do 
                local poly = v.Blip[Blip]

                local blip = AddBlipForCoord(poly.pos)
                SetBlipSprite(blip, poly.id)
                SetBlipDisplay(blip, 4)
                SetBlipColour(blip, poly.color)
                SetBlipScale(blip, poly.scale)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(poly.label)
                EndTextCommandSetBlipName(blip)
            end
        end

        if v.Storages then 
            for stash = 1, #v.Storages do 
                local poly = v.Storages[stash]
                exports['qb-target']:AddBoxZone('ren-business:storages:'..k..stash, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:storages:'..k..stash,
                    heading = poly.heading,
                    debugPoly = Config.Debug,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = 'ren-business:open:storage',
                            icon = 'fas fa-box-open',
                            label = poly.stash.label,
                            job = poly.stash.job,
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
                    debugPoly = Config.Debug,
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
                            icon = "fas fa-receipt",
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
                exports['qb-target']:AddBoxZone('ren-business:crafting:'..k..craft, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:crafting:'..k..craft,
                    heading = poly.heading,
                    debugPoly = Config.Debug,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = "ren-businesses:open:craft",
                            icon = "fas fa-temperature-high",
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
                exports['qb-target']:AddBoxZone('ren-business:outfits:'..k..outfit, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:outfits:'..k..outfit,
                    heading = poly.heading,
                    debugPoly = Config.Debug,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = "ren-businesses:open:outfits",
                            icon = "fas fa-shirt",
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
                    debugPoly = Config.Debug,
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

        if v.Store then 
            for store = 1, #v.Store do 
                local poly = v.Store[store]
                exports['qb-target']:AddBoxZone('ren-business:stores:'..k..store, poly.pos, poly.length, poly.width, {
                    name = 'ren-business:stores:'..k..store,
                    heading = poly.heading,
                    debugPoly = Config.Debug,
                    minZ = poly.minZ,
                    maxZ = poly.maxZ,
                }, {
                    options = {
                        {
                            event = "ren-businesses:open:store",
                            icon = "fas fa-basket-shopping",
                            label = "Open store",
                            job = k,
                            store = store
                        },         
                    },
                    distance = 2.0
                })
            end
        end

    end
end)