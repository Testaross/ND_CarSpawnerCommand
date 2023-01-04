RegisterNetEvent("saveCar")
AddEventHandler("saveCar", function(netID, entity, save)
	SetPedIntoVehicle(cache.ped, entity, -1)
	local check = NetworkGetNetworkIdFromEntity(entity)
	if check ~= entity then return end
	local props = lib.getVehicleProperties(entity)
	print(props) -- ? this area needs some work
	if true then
    	TriggerServerEvent("ND_CarSpawnerCommand:setVehicleOwned", props)
	end
    lib.notify({
        description = 'Vehicle spawned.',
        type = 'success'
    })
end)
