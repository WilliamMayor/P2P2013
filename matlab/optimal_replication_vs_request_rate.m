clear all;
constants;

p = accuracy(3);
a = 10;
max_u = 1000;

optimal_r = ones(max_u,1);
optimal_z = ones(max_u,1);
r = awareness(1:21000);
replication_cost = r.*(64+51);
query_cost = ((115+68+6*a*r./n)*log(1-p))./(p.*log(1-r./n));

for u=1:max_u 
    total = u*query_cost+replication_cost;
    [~, i] = min(total);
    optimal_r(u) = r(i);
    optimal_z(u) = log(1-p)/log(1-r(i)/n);
end

[AX,H1,H2] = plotyy(1:max_u, optimal_r, 1:max_u, optimal_z, 'plot');
set(get(AX(1),'Ylabel'),'String','Optimal replication, r(x)');
set(get(AX(2),'Ylabel'),'String','Optimal z');
xlabel('Search Rate, u');
set(H2,'LineStyle','--');
figure(gcf);