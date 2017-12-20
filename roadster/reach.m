function x= reach(C, route)
%REACH Summary of this function goes here
%   Detailed explanation goes here

%FIXME should we have niter?

% f(x) = 0 when x (distance) is correct
% thus, f is
% f(x) = C - total_consumption(x)
% and
% f'(x) = -consumption(velocity(x))


load(route);
total = @(x) total_consumption(x, route, 256);
f = @(x) C - total(x);
fprim = @(s) -consumption(velocity(s,route));
distance_km=distance_km; % make unambigous
x0 = bisection(f,0,distance_km(end),1e-2); % FIXME why these errors?
[x,niter] = newton(f, fprim, x0, 1e-2);
end

