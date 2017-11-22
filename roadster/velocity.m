function v = velocity(x,route)
%VELOCITY returns velocity `v` at a given length `x`
%   `v`: (km/h)
%   `x`: (km)
%   `route`: filename of data
load(route);
assert(max(x) <= distance_km(end), 'Distance exceded')
v = interp1(distance_km, speed_kmph, x, 'spline');
end

