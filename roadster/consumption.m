function c = consumption(v)
%CONSUMPTION returns energy-consumption `c` for a given velocity `v` on the
%roadster
%   `c`: (Wh/km)
%   `v`: (km/h)

load roadster  
% We don't want to always evaluate the interpolation...
c = interp1(speed_kmph, consumption_Whpkm, v, 'spline');
end

