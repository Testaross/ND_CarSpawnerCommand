RegisterNetEvent("ND_CarSpawnerCommand:setVehicleOwned", function(props)
    local src = source
    exports["ND_VehicleSystem"]:setVehicleOwned(src, props, false)
end)