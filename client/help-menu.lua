local showDialog = false

RegisterCommand("helpOn", function()
    Citizen.CreateThread(function()
        if showDialog == true then
			showDialog = off
			TriggerEvent("helpMenu:off")
		else
			showDialog = on
			TriggerEvent("helpMenu:on")
		end
    end)
end, false)

--//////////////////////////////////////////--

RegisterNetEvent("helpMenu:on")
RegisterNetEvent("helpMenu:off")

AddEventHandler("helpMenu:on", function(value)
    SendNUIMessage({
        showDialog = true
    })
end)

AddEventHandler("helpMenu:off", function(value)
    SendNUIMessage({
        showDialog = false
    })
end)