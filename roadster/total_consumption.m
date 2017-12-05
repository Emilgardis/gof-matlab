function E = total_consumption(x, route, n)
%TOTAL_CONSUMPTION Calculates the consumption [Wh]
%   Detailed explanation goes here

f = @(s) consumption(velocity(s,route));
E = simpson(f, 0, x, n);

end