clear all;
constants;

figure1 = figure('PaperSize',[20.98404194812 29.67743169791]);

% Create axes
axes1 = axes('Parent',figure1,'YScale','log','YMinorTick','on',...
    'YGrid','on','YMinorGrid','off',...
    'XScale','log',...
    'XMinorTick','on');
%% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[1 21000]);
%% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[1000 5500000]);
hold(axes1,'all');

% Create multiple lines using matrix input to loglog
loglog1 = loglog(awareness,'Parent',axes1);
set(loglog1(1),'DisplayName','z=100,r(1)=1000');
set(loglog1(2),'DisplayName','z=100,r(1)=5000');
set(loglog1(3),'DisplayName','z=1000,r(1)=5000');
set(loglog1(4),'DisplayName','z=100,r(1)=50,000');

% Create xlabel
xlabel('Torrent Popularity, x');

% Create ylabel
ylabel('Awareness of Torrent,r(x)');

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','Best');