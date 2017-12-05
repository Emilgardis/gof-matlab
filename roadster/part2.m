t_anna = time_to_destination(65.2162,'speed_anna',100)
t_anna_mat = time_to_destination_matlab(65.2162,'speed_anna');
c_anna = total_consumption(65.2162,'speed_anna',100)
c_anna_mat = total_consumption_matlab(65.2162,'speed_anna');

t_elsa = time_to_destination(65.0040,'speed_elsa',100)
t_elsa_mat = time_to_destination_matlab(65.0040,'speed_elsa');
c_elsa = total_consumption(65.0040,'speed_elsa',100)
c_elsa_mat = total_consumption_matlab(65.0040,'speed_elsa');

disp(t_anna - t_anna_mat);
disp(c_anna - c_anna_mat);
loglog(

function T = time_to_destination_matlab(x, route)
%TIME_TO_DESTINATION returns time to destination
% 
% Uses matlab `integral`
% time is
% \( T(x) = \int_0^x \frac{1}{v(s)} \, ds \)
% v(s) is positive
f = @(s) 1./velocity(s,route);
T = integral(f,0,x);
end

function E = total_consumption_matlab(x, route)
%TOTAL_CONSUMPTION Calculates the consumption [Wh]
%   

f = @(s) consumption(velocity(s,route));
E = integral(f, 0, x);

end