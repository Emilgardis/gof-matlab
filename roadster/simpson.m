function S = simpson(func, a, b, n)
%SIMPSON Integral via simpsons
% S = simpson(func, a, b, n)
% 
% \( n \equiv 0 \pmod{2} \)
% This function uses Simpson's rule to approximate the
% integral of the function func over the interval [a, b].
% See also integral
if (mod(n,2))
    error('n must be even');
end

h = (b-a)/n;
x = a:h:b; % x = linspace(a,b,n+1);
fx = func(x);
S = (h/3)*( 4*sum(fx(2:2:end-1)) + 2*sum(fx(3:2:end-2)) + fx(1) + fx(end) );
end