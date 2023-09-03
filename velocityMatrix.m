function velocities = velocityMatrix(salinities, temperatures, depths)
    [nLon, nLat, nDepth] = size(salinities);
    velocities = zeros(nLon, nLat, nDepth);
  
    for lon = 1:nLon
        for lat = 1:nLat
            for d = 1:nDepth
                temperature = temperatures(lon, lat, d);
                salinity = salinities(lon, lat, d);
                depth = depths(d);
                velocities(lon, lat, d) = calcVelocity(temperature, salinity, depth);
            end
        end
    end
end
