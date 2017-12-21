function x = distance(T, route )
%DISTANCE gives distance after T hours

% f(x) = 0 when x (distance) is correct
% thus, f is
% f(x) = T - time_to_destination(x)
% and
% f'(x) = - 1/velocity(x)
load(route);
time = @(x) time_to_destination(x, route, 256);
f = @(x) T - time(x);
fprim = @(s) -1./velocity(s,route);
distance_km=distance_km; % make unambigous
x0 = bisection(f,0,distance_km(end),1e-2);
x = newton(f, fprim, x0, 1e-2);
end
