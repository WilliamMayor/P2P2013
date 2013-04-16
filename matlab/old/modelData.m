clear all;

raw = importdata('/Users/william/Dropbox/Uni/Data/pePto.txt', ' ',1);
sorted = flipdim(sortrows(raw.data,2),1);
%sorted = sorted(1:1800,:);

[slope intercept r2 s] = logfit(sorted(:,2),sorted(:,1),'loglog');

X = sorted(:,2);
Y = [sorted(:,1) (10^intercept)*sorted(:,2).^(slope)];

figure1 = figure();

% Create axes
axes1 = axes('Parent',figure1,'YScale','log','YGrid','on','XScale','log',...
    'GridLineStyle','--',...
    'FontSize',15,...
    'FontName','Monaco');
hold(axes1,'all');

% Create multiple lines using matrix input to loglog
loglog1 = loglog(X,Y,'Parent',axes1);
set(loglog1(1),'Marker','.','LineStyle','none','DisplayName','Data');
set(loglog1(2),'LineWidth',2,'DisplayName',['$y = 10^{' num2str(intercept,3) '}x^{' num2str(slope,3) '}$']);

%z=1000;

%SP=5000000*(1-exp(log(1-0.8)/z));
%line([SP SP],get(axes1,'XLim'));

%SP=5000000/z*(1-exp(log(1-0.8)/z));
%line([SP SP],get(axes1,'XLim'))

% Create xlabel
xlabel('Torrent Popularity','FontSize',15);

% Create ylabel
ylabel('Frequency Observed','FontSize',15);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Interpreter','latex',...
    'Position',[0.723880597014925 0.671087533156499 0.155741310207636 0.234766142089715],...
    'FontSize',15);