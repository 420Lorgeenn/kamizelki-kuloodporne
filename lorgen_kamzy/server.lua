ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lekkakamza', function(source)
	TriggerClientEvent('lorgen_kamzy:lekka',source)
end)

ESX.RegisterUsableItem('ciezkakamza', function(source)
	TriggerClientEvent('lorgen_kamzy:ciezka',source)
end)

RegisterServerEvent('zabierzitem')
AddEventHandler('zabierzitem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('lekkakamza', 1)
end)
RegisterServerEvent('zabierzitem2')
AddEventHandler('zabierzitem2', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('ciezkakamza', 1)
end)