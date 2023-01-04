local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ren-businesses:create:bill", function(data)
    QBCore.Functions.TriggerCallback('ren-businesses:can:create:bill', function(result)
        if not result then 
            QBCore.Functions.Notify('There is already a bill created!', 'error', 6000)
        else 
            local bill = exports['qb-input']:ShowInput({
                header = "Cash Register",
                submitText = 'Create bill',
                inputs = {
                    {
                        type = 'number',
                        isRequired = true,
                        name = 'billamount',
                        text = "Bill amount"
                    },
                    {
                        type = 'text',
                        isRequired = true,
                        name = 'billreason',
                        text = 'Bill reason'
                    }
                }
            })
            if bill then
                if not bill.billamount or not bill.billreason then return end
                TriggerServerEvent("ren-businesses:create:bill:server", {
                    job = data.job,
                    register = data.register,
                    price = bill.billamount,
                    reason = bill.billreason
                })
            end
        end
    end, data)
end)

RegisterNetEvent('ren-businesses:pay:bill', function(data)
    QBCore.Functions.TriggerCallback("ren-businesses:get:bill:data", function(result)
        if not result then 
            QBCore.Functions.Notify("There are no bills to pay", 'error', 6000)
        else 
            exports['qb-menu']:openMenu({
                {
                    header = "Cash register",
                    txt = "Select a payment method",
                    isMenuHeader = true
                },
                {
                    header = "Pay with bank",
                    txt = "You need to pay "..result.price.."$ for: "..result.reason,
                    params = {
                        isServer = true,
                        event = "ren-business:pay:bills",
                        args = {
                            type = "bank",
                            job = data.business,
                            register = data.register
                        }
                    }
                },
                {
                    header = "Pay with cash",
                    txt = "You need to pay "..result.price.."$ for: "..result.reason,
                    params = {
                        isServer = true,
                        event = "ren-business:pay:bills",
                        args = {
                            type = "cash",
                            job = data.business,
                            register = data.register
                        }
                    }
                },
                {
                    header = "< close",
                    txt = "",
                    params = {
                        event = "qb-menu:closeMenu"
                    }
                },
            })
        end
    end, data)
end)

RegisterNetEvent('ren-businesses:delete:bill', function(data)
    QBCore.Functions.TriggerCallback("ren-businesses:is:bill:created", function(result)
        if not result then 
            QBCore.Functions.Notify('There are no bills to be deleted!', 'error', 6000)
        else 
            QBCore.Functions.Notify('Bill successfully deleted!', 'success', 6000)
            TriggerServerEvent("ren-business:clear:bill", data)
        end
    end, data)
end)