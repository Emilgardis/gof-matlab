a = 0;
b = 1.2;
Iref = integral(@humps,a,b,'AbsTol',1e-12,'RelTol',1e-12);

fprintf('%6s %10s %10s %15s %15s\n', 'n', 'Iref-Th', 'Iref-Sh', '(Iref-T2h)/(Iref-Th)', '(Iref-S2h)/(Iref-Sh)')
n=4;
for i=1:10
  Th  = trapets(@humps,a,b,n);
  T2h = trapets(@humps,a,b,n/2);
  Sh  = simpson(@humps,a,b,n);
  S2h = simpson(@humps,a,b,n/2);
  fprintf('%6i %10.2e %10.2e %15.2f %15.2f\n', n, Iref-Th, Iref-Sh, (Iref-T2h)/(Iref-Th), (Iref-S2h)/(Iref-Sh))
  ET(i) = abs(Iref-Th);
  ES(i) = abs(Iref-Sh);  
  h(i) = (b-a)/n;
  n = 2*n;
end

figure(1);clf
loglog(h,ET,'o-b',h,ES,'x-r')
hold on
loglog(h,h.^2,'--',h,h.^4,'-.')
legend('Trapets','Simpson','h^2','h^4','Location','Best')
xlabel('h')
ylabel('Fel')
set(gca,'FontSize',14)
axis([min(h) max(h) min(ES) 10])
