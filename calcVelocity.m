function c = calcVelocity(temperature, salinity, depth)
  c = 1448.96 + 4.591 * temperature - 0.05304 * temperature^2;
  c = c + 2.374 * 10^(-4) * temperature^3 + 1.340 * (salinity - 35);
  c = c + 0.0163 * depth + 1.675 * 10^(-7) * depth^2;
  c = c - 0.01025 * temperature * (salinity - 35);
  c = c - 7.139 * 10^(-13) * temperature * depth^3;
end
