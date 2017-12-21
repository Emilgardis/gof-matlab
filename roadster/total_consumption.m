function E = total_consumption(x, route, n)
%TOTAL_CONSUMPTION Calculates the consumption [Wh]

% \( n \equiv 0 (\textrm{mod} 2) \)
% the consumption is defined as
% \( E(x) = \int_0^x c(v(s)) \, ds \)

f = @(s) consumption(velocity(s,route));
if x == 0
    % small fix to start position
    E = 0;
    return
end
E = simpson(f, 0, x, n);

end