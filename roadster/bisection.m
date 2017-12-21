function x = bisection(f,a,b,err)
%BISECTION get the root, f(x) = 0
% See also newton, fzero

assert(sign(f(a)) ~= sign(f(b)))
x = (a+b)/2;
while (abs((b-a)/2) > err)
    if (sign(f(a)) == sign(f(x)))
        a=x;
    else
        b=x;
    end
    x =(a+b)/2;
end
end