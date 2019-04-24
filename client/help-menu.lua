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
    local PlayerData
    if anotherPlayerInventory then
        PlayerData = anotherPlayer
    else
        PlayerData = ESX.GetPlayerData()
    end

    local playerPed = PlayerPedId()
    local inventory = PlayerData["inventory"]
    local money = PlayerData["money"]
    local accounts = PlayerData["accounts"]
    local items  = {}

    if Config.IncludeCash and money ~= nil then
        if money > 0 then
            local formattedMoney = ESX.Math.GroupDigits(money)

            table.insert(items, {
                label     = _U('cash'),
                count     = formattedMoney,
                type      = 'item_money',
                name     = 'cash',
                usable    = false,
                rare      = false,
                limit = -1,
                canRemove = true
            })
        end
    end

    if Config.IncludeAccounts and accounts ~= nil then
        for i=1, #accounts, 1 do
            if not shouldSkipAccount(accounts[i].name) then
                if accounts[i].money > 0 then
                    local canDrop = accounts[i].name ~= 'bank'

                    table.insert(items, {
                        label     = accounts[i].label,
                        count     = accounts[i].money,
                        type      = 'item_account',
                        name     = accounts[i].name,
                        usable    = false,
                        rare      = false,
                        limit = -1,
                        canRemove = canDrop
                    })
                end
            end
        end
    end
    
    for i=1, #inventory, 1 do
		if inventory[i].count > 0 then
			table.insert(items, {
				label     = inventory[i].label,
				type      = 'item_standard',
				count     = inventory[i].count,
				name     = inventory[i].name,
				usable    = inventory[i].usable,
				rare      = inventory[i].rare,
				limit      = inventory[i].limit,
				canRemove = inventory[i].canRemove
			})
		end
    end

    if Config.IncludeWeapons then
        local weaponsList = ESX.GetWeaponList()
        for i=1, #weaponsList, 1 do
            local weaponHash = GetHashKey(weaponsList[i].name)

            if HasPedGotWeapon(playerPed, weaponHash, false) and weaponsList[i].name ~= 'WEAPON_UNARMED' then
                local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                table.insert(items, {
                    label     = weaponsList[i].label,
                    count     = ammo,
                    limit     = -1,
                    type      = 'item_weapon',
                    name     = weaponsList[i].name,
                    usable    = false,
                    rare      = false,
                    canRemove = true
                })
            end
        end
    end
    
    
    SendNUIMessage({
        action = "setItems",
        itemList = items
    })
end

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