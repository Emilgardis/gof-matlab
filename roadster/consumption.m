function c = consumption(v)
%CONSUMPTION returns energy-consumption `c` for a given velocity `v`
%   `c`: (Wh/km)
%   `v`: (km/h)
global consumption_array;
c = consumption_array(v);
end

