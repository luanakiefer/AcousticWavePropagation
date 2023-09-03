function [N, dt, x] = wavePropagation(velocities, boundaryConditionType, fontType, frequency, delay, lengthX, lengthY, fontX, fontY, tFinal) 
    cMax = max(velocities);
    Cr = 1;

    parq = 10;

    dx = 1;
    dy = dx;
    ds = sqrt(dx^2 + dy^2);
    dt = Cr * (dx * dy) / (ds * cMax);

    x = 0:dx:lengthX;
    y = 0:dy:lengthY;

    nx = length(x);
    ny = length(y);

    N = floor(tFinal / dt);

    mate = ones(ny,nx);

    het2(dx, dt, uint64(N), uint64(nx), uint64(ny), uint64(fontY), uint64(fontX), delay, frequency, velocities, uint64(parq), uint64(boundaryConditionType), uint64(fontType), mate)
end

