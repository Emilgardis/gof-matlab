%clear;
load roadster;
subplot(4,1,1);
plot(speed_kmph, consumption_Whpkm, 'x'), hold on
plot(0:0.1:200,consumption(0:0.1:200),'k')
title('Roadster')
xlabel('speed [km/h]')
ylabel('consumption [Wh/km]')
subplot(4,1,2);
battery = 55e3; % Wh
reach = battery./(consumption(0:0.1:200));
plot(0:0.1:200, reach)
title('Expected Reach at fully charged')
xlabel('speed [km/h]')
ylabel('reach [km]')
[max_val,idx] = max(reach);
hold on;
max_x = (idx-1)/10;
plot(max_x,max_val,'o','MarkerSize',10);
str = ['Maximum = (',num2str(max_x), ', ',num2str(max_val),')'];
text(60,200,str,'HorizontalAlignment','right');
subplot(4,1,3);
plot(0:0.1:65,velocity(0:0.1:65,'speed_elsa'))
xlabel('distance [km]')
ylabel('speed [km/h]')
title('Elsa')
subplot(4,1,4)
plot(0:0.1:65,velocity(0:0.1:65,'speed_anna'))
title('Anna')
xlabel('distance [km]')
ylabel('speed [km/h]')