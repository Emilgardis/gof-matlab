t_anna = time_to_destination(65.2162,'speed_anna',256)
t_anna_mat = time_to_destination_matlab(65.2162,'speed_anna');
c_anna = total_consumption(65.2162,'speed_anna',256)
c_anna_mat = total_consumption_matlab(65.2162,'speed_anna');

t_elsa = time_to_destination(65.0040,'speed_elsa',100)
t_elsa_mat = time_to_destination_matlab(65.0040,'speed_elsa');
c_elsa = total_consumption(65.0040,'speed_elsa',100)
c_elsa_mat = total_consumption_matlab(65.0040,'speed_elsa');

n=2;
h = zeros(1,10);
E = zeros(1,10);
for i=1:10
    E(i) = abs(t_anna_mat - time_to_destination(65.2162,'speed_anna',n));
    h(i) = 65.2162/n;
    n = 2*n;
end
clf;
loglog(h,E,'x-r');
hold on;
loglog(h,h,'--',h,h.^2,'-.',h,h.^4, '-');
axis([min(h) max(h) min(E) 10]);
legend('Simpson','h','h^2','h^4','Location','Best');
xlabel('h');
ylabel('error');
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