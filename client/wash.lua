local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ren-businesses:wash:hands", function()
    QBCore.Functions.Progressbar("wash_hands", 'Washing your hands...', 5000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "mp_arresting",
		anim = "a_uncuff",
		flags = 49,
	}, {}, {}, function()
        QBCore.Functions.Notify('You washed your hands!', 'success', 5000)
	end, function()
		QBCore.Functions.Notify("Canceled...", "error")
	end)
end)