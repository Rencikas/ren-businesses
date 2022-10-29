RegisterNetEvent('ren-businesses:change:duty', function()
    exports['qb-menu']:openMenu({
        {
            header = "Change duty",
            isMenuHeader = true, 
        },
        {
            header = "Duty",
            txt = "Start / end duty",          
            icon = "fa-solid fa-clipboard-user",
            params = {
                isServer = true,
                event = "QBCore:ToggleDuty",
                args = {
                    
                }
            }
        },
    })
end)