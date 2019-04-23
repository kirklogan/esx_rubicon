local showDialog = false

RegisterCommand("helpOn", function()
    Citizen.CreateThread(function()
        showDialog = on
		TriggerEvent("helpMenu:on")
    end)
end, false)

RegisterCommand("helpOff", function()
    Citizen.CreateThread(function()
        showDialog = off
		TriggerEvent("helpMenu:off")
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