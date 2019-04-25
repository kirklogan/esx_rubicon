ESX              = nil
local showDialog = false

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

RegisterCommand("help", function()
    if showDialog == true then
		TriggerEvent("helpMenu:off")
	else
		TriggerEvent("helpMenu:on")
	end
end, false)

--//////////////////////////////////////////--

RegisterNetEvent("helpMenu:on")
RegisterNetEvent("helpMenu:off")

AddEventHandler("helpMenu:on", function(value)
	SetNuiFocus(true,true)
	showDialog = true
    SendNUIMessage({
        showDialog = true,
		money = ESX.GetPlayerData()["money"]
    })
	
	TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = true,
	  args = {ESX.GetPlayerData()}
	})
end)

AddEventHandler("helpMenu:off", function(value)
	SetNuiFocus(false)
	showDialog = false
    SendNUIMessage({
        showDialog = false
    })
end)

RegisterNUICallback('escape', function(data, cb)
	TriggerEvent('helpMenu:off')
	cb('ok')
end)