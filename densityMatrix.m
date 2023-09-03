function densities = densityMatrix(salinities, temperatures)
    [nLon, nLat, nDepth] = size(salinities);
    densities = zeros(nLon, nLat, nDepth);
  
    for lon = 1:nLon
        for lat = 1:nLat
            for depth = 1:nDepth
                temperature = temperatures(lon, lat, depth);
                salinity = salinities(lon, lat, depth);
                densities(lon, lat, depth) = calcDensity(temperature, salinity);
            end
        end
    end
end