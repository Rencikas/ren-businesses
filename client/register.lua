local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ren-businesses:create:bill", function(data)
    QBCore.Functions.TriggerCallback('ren-businesses:create:bill', function(result)
        if not result then 
            QBCore.Functions.Notify('There is already a bill created', 'error', 5500)
        else 
            local bill = exports['qb-input']:ShowInput({
                header = "Register",
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
                        text = 'Reason'
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
    QBCore.Functions.TriggerCallback("ren-businesses:is:bill:created", function(result, bData)
        if not result then 
            QBCore.Functions.Notify("There are no bills to pay", 'error', 7500)
        else 
            exports['qb-menu']:openMenu({
                {
                    header = "Register",
                    txt = "Select a payment method",
                    isMenuHeader = true
                },
                {
                    header = "Pay with bank",
                    txt = "You need to pay "..bData.price.."$ for: "..bData.reason,
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
                    txt = "You need to pay "..bData.price.."$ for: "..bData.reason,
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
    QBCore.Functions.TriggerCallback("ren-businesses:is:bill:created", function(result, data)
        print(json.encode(result))
        if not result then 
            QBCore.Functions.Notify('There are no bills to be deleted', 'error', 5500)
        else 
            TriggerServerEvent("ren-business:clear:bill", data)
        end
    end, data)
end)