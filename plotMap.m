function plotMap(latitudes, longitudes, data, depth, label, unity, shapefile)
    shape = shaperead(shapefile, 'UseGeoCoords', true);
    LAT = (shape.Lat);
    LON = (shape.Lon);
    
    [lat, lon] = meshgrid(latitudes, longitudes);

    m_proj('lambert', 'lat', [min(min(lat)) max(max(lat))], 'lon',[min(min(lon)) max(max(lon))]);
    m_line(LON(1,:), LAT(1,:), 'color', 'k', 'linewidth', 1.5);
    m_grid('box', 'fancy', 'linestyle', '-', 'gridcolor', 'k', 'fontsize', 18, 'fontweight', 'bold');
    hold on;
    
    m_contourf(lon, lat, data, 70, 'LineStyle', 'none');
    h = colorbar;
    h.Label.String = unity;
    h.Label.FontSize = 14;
    xlabel('Longitude', 'fontsize', 16, 'fontweight', 'bold');
    ylabel('Latitude', 'fontsize', 16, 'fontweight', 'bold');
    title(strcat(label, " à ", num2str(depth), "m"), 'fontsize', 14, 'fontweight', 'bold');
    set(gca, 'FontSize', 18, 'fontweight', 'bold');
end