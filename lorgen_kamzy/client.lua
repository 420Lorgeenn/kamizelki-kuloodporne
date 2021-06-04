
ESX                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

local check = true

RegisterNetEvent('lorgen_kamzy:lekka')
AddEventHandler('lorgen_kamzy:lekka', function()
if check then
	ESX.UI.Menu.CloseAll()
	local lib, anim = 'clothingtie', 'try_tie_negative_a'
	local playerPed = PlayerPedId()
	exports['progressBars']:startUI(9200, "Zakładasz kamizelkę kuloodporną")
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(500)
		while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end
		TriggerEvent('lorgen_kamzy:dajkevlar', 'lekka', true)
		ESX.ShowNotification('Założyłeś kamizelkę kuloodporną')
		TriggerServerEvent('zabierzitem')
		check = false
	end)
else
	ESX.ShowNotification('Nie mozesz uzyc teraz tego przedmiotu')
end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if check == false then
			Citizen.Wait(Lorgen.CoolDown)
			check = true
		end
	end
end)




RegisterNetEvent('lorgen_kamzy:ciezka')
AddEventHandler('lorgen_kamzy:ciezka', function()
if check then
	ESX.UI.Menu.CloseAll()
	local lib, anim = 'clothingtie', 'try_tie_negative_a'
	local playerPed = PlayerPedId()
	exports['progressBars']:startUI(9200, "Zakładasz kamizelkę kuloodporną")
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(500)
		while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end
		TriggerEvent('lorgen_kamzy:dajkevlar', 'ciezka', true)
		ESX.ShowNotification('Założyłeś kamizelkę kuloodporną')
		TriggerServerEvent('zabierzitem2')
		check = false
	end)
else
	ESX.ShowNotification('Nie mozesz uzyc teraz tego przedmiotu')
end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if check == false then
			Citizen.Wait(60000)
			check = true
		end
	end
end)


RegisterNetEvent('lorgen_kamzy:dajkevlar')
AddEventHandler('lorgen_kamzy:dajkevlar', function(TypKamzy)
	local playerPed = PlayerPedId()
	if TypKamzy == 'lekka' then
		SetPedArmour(playerPed, Lorgen.LekkaKamza)
	elseif TypKamzy == 'ciezka' then
		SetPedArmour(playerPed, Lorgen.CiezkaKamza)
	end
	ESX.ShowNotification('Założyłeś kamizelkę kuloodporną')
end)