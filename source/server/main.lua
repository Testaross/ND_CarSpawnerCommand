RegisterCommand('car', function(source, args)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local veh = args[1]
    local save = args[2]
    local heading = GetEntityHeading(ped)
    if veh == nil then veh = "adder" end
    if save == nil then save = false end
    local entity = CreateVehicleServerSetter(joaat(veh), 'automobile', coords + vector3( 0.0, 3.0, 0.5), heading)
    if DoesEntityExist(entity) then
        Wait(0)
        local netID = NetworkGetNetworkIdFromEntity(entity)
        TriggerClientEvent('saveCar',source, netID, entity, save)
    else
        print(("^1Failed to spawn vehicle '%s'^0"):format(v.model))
    end
end)
