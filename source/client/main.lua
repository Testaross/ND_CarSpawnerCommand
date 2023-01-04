RegisterCommand('car', function(args)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = args[1]
    local type = args[2]
    local ped = cache.ped
    if veh == nil then veh = "adder" end
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Wait(100)
            if waiting > 5000 then
                lib.notify({
                    description = 'Could not load the vehicle model in time, a crash was prevented.',
                    type = 'error'
                })
                break
            end
        end
        if type == "spawn" then
            CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId()) + 90, 1, 0)
            lib.notify({
                description = 'Vehicle spawned.',
                type = 'success'
            })
            Wait(1000)
            local vehicle = GetVehiclePedIsIn(ped, false)
            exports["ND_VehicleSystem"]:setVehicleLocked(vehicle, false)
            lib.notify({
                description = 'Vehicle unlocked.',
                type = 'success'
            })
        elseif type == "own" then
            CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId()) + 90, 1, 0)
            lib.notify({
                description = 'Vehicle spawned.',
                type = 'success'
            })
            Wait(1000)
            local vehicle = GetVehiclePedIsIn(ped, false)
            local props = lib.getVehicleProperties(vehicle)
            TriggerServerEvent("ND_CarSpawnerCommand:setVehicleOwned", props)
            lib.notify({
                description = 'You now own this vehicle.',
                type = 'success'
            })
        end
    end)
end)
