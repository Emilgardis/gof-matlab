function [x, niter] = newton(f, fprim, x0, err)
%NEWTON Newton's method for finding successively better approximations to the 
%   zeroes of a real-valued function.
% x = newton(f, fprim, x0, err)
% See also bisection, fzero
  maxiter = 1000;
  x = x0;
  dx = 2*err;
  niter = 0;
  while (abs(dx) > err && niter < maxiter)
    niter = niter + 1;
    dx = -f(x)/(fprim(x));
    x = x+dx;
  end

  if (niter == maxiter)
    error('Newton did not converge within maxiter iterations')
  end
end