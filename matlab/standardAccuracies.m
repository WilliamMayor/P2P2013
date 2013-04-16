clear all;
constants;
pePto;

model = (10^intercept.*popularity.^slope);
chance = zeros(size(popularity,2),size(z,2));
for i = 1:size(chance,1)
    chance(i,:) = 1 - (1 - i/n).^z;
end
figure1 = figure('PaperSize',[20.98404194812 29.67743169791]);
% Create axes
axes1 = axes('Parent',figure1,'YGrid','on');
%% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 21000]);
hold(axes1,'all');
% Create multiple lines using matrix input to plot
plot1 = plot(chance,'Parent',axes1);
set(plot1(1),'LineStyle','--','DisplayName','z=100');
set(plot1(2),'LineStyle','-.','Color',[1 0 0],'DisplayName','z=500');
set(plot1(3),'Color',[0 0.498039215803146 0],'DisplayName','z=1000');
% Create xlabel
xlabel('Torrent Popularity, x');
% Create ylabel
ylabel('Probability of Successful Query, P(d)');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','Best');

% model*chance/sum(model)*100

proportion = zeros(1000,4);
for z = 1:1000
    r = ceil(n.*(1-exp(log(1-accuracy)./z)));
    for i = 1:size(accuracy,2)
        proportion(z,i) = sum(model(r(i):end))/sum(model);
    end
end
% plot(proportion)
% xlabel('Number of Nodes Queried, z');
% ylabel('Proportion of Torrents That Are Discoverable');