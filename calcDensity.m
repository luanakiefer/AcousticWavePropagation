function density = calcDensity(temperature, salinity)
    A = 8.24493 * 10^(-1) - 4.0899 * 10^(-3) * temperature + 7.6438 * 10^(-5) * (temperature)^2 - 8.2467 * 10^(-7) * (temperature)^3 + 5.3875 * 10^(-9) * (temperature)^4;
    B = -5.72466 * 10^(-3) + 1.0227 * 10^(-4) * temperature - 1.6546 * 10^(-6) * (temperature)^2;
    C = 4.8314 * 10^(-4);
    d0 = 999.842594 + 6.793952 * 10^(-2) * temperature - 9.095290 * 10^(-3) * (temperature)^2 + 1.001685 * 10^(-4) * (temperature)^3 - 1.120083 * 10^(-6) * (temperature)^4 + 6.536336 * 10^(-9) * (temperature)^5;

    density = d0 + A * salinity + B * (salinity)^(3/2) + C * salinity;
end