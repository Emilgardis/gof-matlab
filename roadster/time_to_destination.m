function T = time_to_destination(x, route, n)
%TIME_TO_DESTINATION returns time to destination
%
% \( n \equiv 0 \pmod{2} \)
% Recommended 50 < n < 300
% time is
% \( T(x) = \int_0^x \frac{1}{v(s)} \, ds \)
% v(s) is positive
f = @(s) 1./velocity(s,route);
T = simpson(f, 0, x, n);
end

function T = time_to_destination_matlab(x, route, n)
%TIME_TO_DESTINATION returns time to destination
% 
% Uses matlab `integral`
% time is
% \( T(x) = \int_0^x \frac{1}{v(s)} \, ds \)
% v(s) is positive
f = @(s) 1./velocity(s,route);
T = integral(f,0,x);
end