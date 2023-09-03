clear all
close all
clc

fileName = "./data/hycom_20121231.nc";

[latitudes, longitudes, salinities, temperatures] = parseData(fileName);
depths = [0, 2, 4, 6, 8, 10, 12, 15, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 90, 100, 125, 150, 200, 250, 300, 350, 400, 500, 600, 700, 800, 900, 1000, 1250, 1500, 2000, 2500, 3000, 4000, 5000];

velocities = velocityMatrix(salinities, temperatures, depths);
densities = densityMatrix(salinities, temperatures);

[nLon, nLat, nDepht] = size(salinities);

%% -- Plot profiles

lon = "35.04W";
lon_idx = 76;

lat = "20.32S";
lat_idx = 22;

velocity_fig = figure(1);
plot(squeeze(velocities(lon_idx, lat_idx, :)), depths)
axis 'ij'
title(strcat("Perfil de velocidade do som na costa do ES ", lat, ", ", lon, " - 31/12/2012"), 'fontweight', 'bold')
xlabel("Velocidade do som (m/s)")
ylabel("Profundidade (m)")
set(gca, 'ytick', 0:500:5000)
%saveas(velocity_fig, "./figures/profiles/es_perfil_vel_1.png")

salinity_fig = figure(2);
plot(squeeze(salinities(lon_idx, lat_idx, :)), depths)
axis 'ij'
title(strcat("Perfil de salinidade na costa do ES ", lat, ", ", lon, " - 31/12/2012"), 'fontweight', 'bold')
xlabel("Salinidade (psu)")
ylabel("Profundidade (m)")
set(gca, 'ytick', 0:500:5000)
%saveas(salinity_fig, "./figures/profiles/es_perfil_sali_1.png")

temp_fig = figure(3);
plot(squeeze(temperatures(lon_idx, lat_idx, :)), depths)
axis 'ij'
title(strcat("Perfil de temperatura na costa do ES ", lat, ", ", lon, " - 31/12/2012"), 'fontweight', 'bold')
xlabel("Temperatura (ºC)")
ylabel("Profundidade (m)")
set(gca, 'ytick', 0:500:5000)
%saveas(temp_fig, "./figures/profiles/es_perfil_temp_1.png")

density_fig = figure(4);
plot(squeeze(densities(lon_idx, lat_idx, :)), depths)
axis 'ij'
title(strcat("Perfil de densidade na costa do ES ", lat, ", ", lon, " - 31/12/2012"), 'fontweight', 'bold')
xlabel("Densidade (Kg/mˆ3)")
ylabel("Profundidade (m)")
set(gca, 'ytick', 0:500:5000)
%saveas(density_fig, "./figures/profiles/es_perfil_dens_1.png")

%% Mapas

salinities_dephts = zeros(nLon, nLat, 4);
temperatures_dephts = zeros(nLon, nLat, 4);
densities_dephts = zeros(nLon, nLat, 4);
depths_idx = [1, 20, 33, 36]; % Superficie; 100m; 1000m; 2000m

for ind = 1:4
    depth_idx = depths_idx(ind);
    for lon = 1:nLon
        for lat = 1:nLat
            salinities_dephts(lon, lat, ind) = salinities(lon, lat, depth_idx);
            temperatures_dephts(lon, lat, ind) = temperatures(lon, lat, depth_idx);
            densities_dephts(lon, lat, ind) = densities(lon, lat, depth_idx);
        end
    end
end

shapefile = "./geo-shapes/brazil.shp";

for ind = 1:4
    depth = depths(depths_idx(ind));

    figure(ind);
    plotMap(latitudes, longitudes, salinities_dephts(:, :, ind), depth, "Salinidade", "PSU", shapefile);

    figure(ind + 4);
    plotMap(latitudes, longitudes, temperatures_dephts(:, :, ind), depth, "Temperatura", "ºC", shapefile);

    figure(ind + 8);
    plotMap(latitudes, longitudes, densities_dephts(:, :, ind), depth, "Densidade", "kg/m^3", shapefile);
end

%% -- Plot profiles multiple latitudes

lats = ["18.00S", "19.04S", "20.00S", "21.04S", "22.00S"];
latitudes_idx = [51, 38, 26, 13, 1];

velocity_fig = figure(1);
for idx = 1:5
    plot(squeeze(velocities(lon_idx, latitudes_idx(idx), :)), depths, 'LineWidth', 1.5)
    hold on
end
axis 'ij'
title(strcat("Perfil de velocidade do som na longitude ", lon, " e diferentes latitudes na costa do ES"), 'fontsize', 14, 'fontweight', 'bold')
xlabel("Velocidade do som (m/s)", 'fontsize', 16, 'fontweight', 'bold')
ylabel("Profundidade (m)", 'fontsize', 16, 'fontweight', 'bold')
legend(lats)
set(gca, 'ytick', 0:500:5000);
set(gca, 'FontSize', 18, 'fontweight', 'bold');
%saveas(velocity_fig, "./figures/profiles/es_perfil_vel_1.png")

salinity_fig = figure(2);
for idx = 1:5
    plot(squeeze(salinities(lon_idx, latitudes_idx(idx), :)), depths, 'LineWidth', 1.5)
    hold on
end
axis 'ij'
title(strcat("Perfil de salinidade na longitude ", lon, " e diferentes latitudes na costa do ES"), 'fontsize', 14, 'fontweight', 'bold')
xlabel("Salinidade (psu)", 'fontsize', 16, 'fontweight', 'bold')
ylabel("Profundidade (m)", 'fontsize', 16, 'fontweight', 'bold')
legend(lats)
set(gca, 'ytick', 0:500:5000);
set(gca, 'FontSize', 18, 'fontweight', 'bold');
%saveas(salinity_fig, "./figures/profiles/es_perfil_sali_1.png")

temp_fig = figure(3);
for idx = 1:5
    plot(squeeze(temperatures(lon_idx, latitudes_idx(idx), :)), depths, 'LineWidth', 1.5)
    hold on
end
axis 'ij'
title(strcat("Perfil de temperatura na longitude ", lon, " e diferentes latitudes na costa do ES"), 'fontsize', 14, 'fontweight', 'bold')
xlabel("Temperatura (ºC)", 'fontsize', 16, 'fontweight', 'bold')
ylabel("Profundidade (m)", 'fontsize', 16, 'fontweight', 'bold')
legend(lats)
set(gca, 'ytick', 0:500:5000);
set(gca, 'FontSize', 18, 'fontweight', 'bold');
%saveas(temp_fig, "./figures/profiles/es_perfil_temp_1.png")

density_fig = figure(4);
for idx = 1:5
    plot(squeeze(densities(lon_idx, latitudes_idx(idx), :)), depths, 'LineWidth', 1.5)
    hold on
end
axis 'ij'
title(strcat("Perfil de densidade na longitude ", lon, " e diferentes latitudes na costa do ES"), 'fontsize', 14, 'fontweight', 'bold')
xlabel("Densidade (Kg/mˆ3)", 'fontsize', 16, 'fontweight', 'bold')
ylabel("Profundidade (m)", 'fontsize', 16, 'fontweight', 'bold')
legend(lats)
set(gca, 'ytick', 0:500:5000);
set(gca, 'FontSize', 18, 'fontweight', 'bold');
%saveas(density_fig, "./figures/profiles/es_perfil_dens_1.png")

%% -- Plot profiles multiple longitudes

lons = ["34.00W", "35.04W", "36.00W", "37.04W", "38.00W"];
longitudes_idx = [89, 76, 64, 51, 39];

velocity_fig = figure(1);
for idx = 1:5
    plot(squeeze(velocities(longitudes_idx(idx), lat_idx, :)), depths, 'LineWidth', 1.5)
    hold on
end
axis 'ij'
title(strcat("Perfil de velocidade do som na latitude ", lat, " e diferentes longitudes na costa do ES"), 'fontsize', 14, 'fontweight', 'bold')
xlabel("Velocidade do som (m/s)", 'fontsize', 16, 'fontweight', 'bold')
ylabel("Profundidade (m)", 'fontsize', 16, 'fontweight', 'bold')
legend(lons)
set(gca, 'ytick', 0:500:5000);
set(gca, 'FontSize', 18, 'fontweight', 'bold');
%saveas(velocity_fig, "./figures/profiles/es_perfil_vel_1.png")

salinity_fig = figure(2);
for idx = 1:5
    plot(squeeze(salinities(longitudes_idx(idx), lat_idx, :)), depths, 'LineWidth', 1.5)
    hold on
end
axis 'ij'
title(strcat("Perfil de salinidade na latitude ", lat, " e diferentes longitudes na costa do ES"), 'fontsize', 14, 'fontweight', 'bold')
xlabel("Salinidade (psu)", 'fontsize', 16, 'fontweight', 'bold')
ylabel("Profundidade (m)", 'fontsize', 16, 'fontweight', 'bold')
legend(lons)
set(gca, 'ytick', 0:500:5000);
set(gca, 'FontSize', 18, 'fontweight', 'bold');
%saveas(salinity_fig, "./figures/profiles/es_perfil_sali_1.png")

temp_fig = figure(3);
for idx = 1:5
    plot(squeeze(temperatures(longitudes_idx(idx), lat_idx, :)), depths, 'LineWidth', 1.5)
    hold on
end
axis 'ij'
title(strcat("Perfil de temperatura na latitude ", lat, " e diferentes longitudes na costa do ES"), 'fontsize', 14, 'fontweight', 'bold')
xlabel("Temperatura (ºC)", 'fontsize', 16, 'fontweight', 'bold')
ylabel("Profundidade (m)", 'fontsize', 16, 'fontweight', 'bold')
legend(lons)
set(gca, 'ytick', 0:500:5000);
set(gca, 'FontSize', 18, 'fontweight', 'bold');
%saveas(temp_fig, "./figures/profiles/es_perfil_temp_1.png")

density_fig = figure(4);
for idx = 1:5
    plot(squeeze(densities(longitudes_idx(idx), lat_idx, :)), depths, 'LineWidth', 1.5)
    hold on
end
axis 'ij'
title(strcat("Perfil de densidade na latitude ", lat, " e diferentes longitudes na costa do ES"), 'fontsize', 14, 'fontweight', 'bold')
xlabel("Densidade (Kg/mˆ3)", 'fontsize', 16, 'fontweight', 'bold')
ylabel("Profundidade (m)", 'fontsize', 16, 'fontweight', 'bold')
legend(lons)
set(gca, 'ytick', 0:500:5000);
set(gca, 'FontSize', 18, 'fontweight', 'bold');
%saveas(density_fig, "./figures/profiles/es_perfil_dens_1.png")

%% -- Plot profiles contourf - different latitudes

figure(1)
plotProfile(depths, latitudes, squeeze(salinities(lon_idx, :, :)), "Perfil de salinidade 35.04W entre 18S e 22S", "Latitudes", "PSU", 0.2);

figure(2)
plotProfile(depths, latitudes, squeeze(velocities(lon_idx, :, :)), "Perfil de velocidade do som 35.04W entre 18S e 22S", "Latitudes", "m/s", 2);

figure(3)
plotProfile(depths, latitudes, squeeze(temperatures(lon_idx, :, :)), "Perfil de temperatura 35.04W entre 18S e 22S", "Latitudes", "ºC", 1);

figure(4)
plotProfile(depths, latitudes, squeeze(densities(lon_idx, :, :)), "Perfil de densidade 35.04W entre 18S e 22S", "Latitudes", "Kg/m^3", 0.2);

%% -- Plot profiles contourf - different longitudes

figure(1)
plotProfile(depths, longitudes, squeeze(salinities(:, lat_idx, :)), "Perfil de salinidade 20.32S entre 34W e 41.04W", "Longitudes", "PSU", 0.2);

figure(2)
plotProfile(depths, longitudes, squeeze(velocities(:, lat_idx, :)), "Perfil de velocidade do som 20.32S entre 34W e 41.04W", "Longitudes", "m/s", 2);

figure(3)
plotProfile(depths, longitudes, squeeze(temperatures(:, lat_idx, :)), "Perfil de temperatura 20.32S entre 34W e 41.04W", "Longitudes", "ºC", 1);

figure(4)
plotProfile(depths, longitudes, squeeze(densities(:, lat_idx, :)), "Perfil de densidade 20.32S entre 34W e 41.04W", "Longitudes", "Kg/m^3", 0.2);

%% -- Create Sismogram

boundaryConditionType = 2;
fontType = 2;

frequency = 150;
delay = 1 / frequency;
tFinal = 0.5;

lengthX = 1100;
lengthY = 600;

fontX = 550;
fontY = 2;

[N, dt, x] = wavePropagation(velocities, boundaryConditionType, fontType, frequency, delay, lengthX, lengthY, fontX, fontY, tFinal);
t = 0:dt:(N-1)*dt;

load('sismograma.mat')

figure(1)
pcolor(x,t,sismograma)
shading interp
colormap(gray)
axis 'ij'
xlabel('(m)')
ylabel('(s)')
clim([min(sismograma(:)) max(sismograma(:))]./25)
set(gca, "fontsize", 16);
ybounds=ylim();