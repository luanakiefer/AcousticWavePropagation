function [latitudes, longitudes, salinities, temperatures] = parseData(fileName)  
  latitudes = ncread(fileName, 'lat');
  longitudes = ncread(fileName, 'lon');

  salinities = ncread(fileName, 'salinity');
  temperatures = ncread(fileName, 'water_temp');
end