function T = trapets(func, a, b, n)
%
% T = trapets(func, a, b, n)
%
% This function uses the trapezoidal rule to approximate the
% integral of the function func over the interval [a, b].

h = (b-a)/n;
x = a:h:b; % x = linspace(a,b,n+1);
fx = func(x);
T = h*(sum(fx) - (fx(1)+fx(end))/2);
