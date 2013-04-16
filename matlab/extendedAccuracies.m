clear all;
constants;
pePto;

model = (10^intercept.*popularity.^slope);
chance = zeros(size(popularity,2),size(z,2));
for i = 1:size(chance,1)
    for j = 1:size(chance,2)
        chance(i,j) = 1 - (1 - awareness(i,j)/n).^z(j);
    end
end
figure1 = figure('PaperSize',[20.98404194812 29.67743169791]);

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XScale','log','XMinorTick','on');
xlim(axes1,[0 21000]);
hold(axes1,'all');

% Create multiple lines using matrix input to semilogx
semilogx1 = semilogx(chance,'Parent',axes1);
set(semilogx1(1),'DisplayName','z=100,r(1)=1000');
set(semilogx1(2),'DisplayName','z=500,r(1)=1000');
set(semilogx1(3),'DisplayName','z=500,r(1)=5000');
set(semilogx1(4),'DisplayName','z=1000,r(1)=5000');

% Create xlabel
xlabel('Torrent Popularity, x');

% Create ylabel
ylabel('Probability of Successful Query, P(d)');

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','Best');

for i=1:size(z,2)
    p = sum(model'.*chance(:,i))/sum(model)*100;
    disp(['For z=' num2str(z(i)) ' ' num2str(p) ' of all torrents are discoverable']);
end

for i=1:10
    p = chance(i,2);
    disp(['z=' num2str(z(2)) ' i=' num2str(i) ' p=' num2str(p) ' #queries=' num2str(1/p)]);
end

% proportion = zeros(1000,4);
% for z = 1:1000
%     r = ceil(n.*(1-exp(log(1-a)./z)));
%     for i = 1:4
%         proportion(z,i) = sum(model(r(i):end))/m;
%     end
% end
% plot(proportion)
% xlabel('Number of Nodes Queried, z');
% ylabel('Proportion of Torrents That Are Discoverable');
% legend('50% Chance to Find','80% Chance to Find','90% Chance to Find','95% Chance to Find','Location','NorthWest');