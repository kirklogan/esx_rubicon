local showDialog = false

RegisterCommand("help", function()
    Citizen.CreateThread(function()
        if showDialog == true then
			showDialog = false
			TriggerEvent("helpMenu:off")
		else
			showDialog = true
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