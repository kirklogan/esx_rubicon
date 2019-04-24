ESX              = nil
local PlayerData = nil;
local anotherPlayerInventory = false
local showDialog = false

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
	
	while true do
        PlayerData = ESX.GetPlayerData()
    end
end)

RegisterCommand("help", function()
    Citizen.CreateThread(function()
        if showDialog == true then
			TriggerEvent("helpMenu:off")
		else
			TriggerEvent("helpMenu:on")
		end
    end)
end, false)

--//////////////////////////////////////////--

RegisterNetEvent("helpMenu:on")
RegisterNetEvent("helpMenu:off")

AddEventHandler("helpMenu:on", function(value)
	SetNuiFocus(true,true)
	showDialog = true
    SendNUIMessage({
        showDialog = true,
		money = PlayerData["money"]
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