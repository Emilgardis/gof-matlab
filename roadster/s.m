load roadster;
global consumption_array;
% Replace with a function call, want to not restrict index. Perhaps using
% native 'spline' is better.
consumption_array =  interp1(speed_kmph, consumption_Whpkm, 2:0.01:200 'spline');