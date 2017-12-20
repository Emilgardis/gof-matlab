function E = total_consumption(x, route, n)
%TOTAL_CONSUMPTION Calculates the consumption [Wh]
%   Detailed explanation goes here

f = @(s) consumption(velocity(s,route));
if x == 0
    % small fix to start position
    E = 0;
    return
end
E = simpson(f, 0, x, n);

end