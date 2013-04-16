clear all;

n = 3000;
z=5;

sim_import = importdata('/Users/william/Projects/SimPact/results-1.txt', ',',1);
sim_data = sim_import.data;
headers = sim_import.colheaders;

%#ok<*FNDSB>
time = sim_data(:,1);
awareness = sim_data(:,find(ismember(headers,' awareness')));
seeders = sim_data(:,find(ismember(headers,' seeders')));
leechers = sim_data(:,find(ismember(headers,' leechers')));
bad_data = sim_data(:,find(ismember(headers,' bad_data')));
left = sim_data(:,find(ismember(headers,' left')));
joined = sim_data(:,find(ismember(headers,' joined')));
response_size = sim_data(:,find(ismember(headers,' response_size')));
request_count = sim_data(:,find(ismember(headers,' request_count')));

figure2 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes2 = axes('Parent',figure2);
box(axes2,'on');
hold(axes2,'all');
plot(time, seeders + leechers)
xlabel('Time');
ylabel('Popularity');
title('popularity over time');

figure1 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
plot(time, 1-(1-awareness/n).^z)
xlabel('Time');
ylabel('Probability of successful query');
title('Probability of successful query over time');

figure2 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes2 = axes('Parent',figure2);
box(axes2,'on');
hold(axes2,'all');
plot(time, seeders, time, leechers)
xlabel('Time');
ylabel('Popularity');
title('popularity over time');

figure3 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes3 = axes('Parent',figure3);
box(axes3,'on');
hold(axes3,'all');
plot(time, awareness)
xlabel('Time');
ylabel('Awareness');
title('awareness over time');

figure4 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes4 = axes('Parent',figure4);
box(axes4,'on');
hold(axes4,'all');
plot(time, bad_data)
xlabel('Time');
ylabel('Bad Data');
title('bad data over time');

figure5 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes5 = axes('Parent',figure5);
box(axes5,'on');
hold(axes5,'all');
plot(time, joined)
xlabel('Time');
ylabel('Joined');
title('Number of peers joining torrent at a given hour');

figure6 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes6 = axes('Parent',figure6);
box(axes6,'on');
hold(axes6,'all');
plot(time, left)
xlabel('Time');
ylabel('Left');
title('Number of peers leaving the torrent at a given hour');

figure6 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes6 = axes('Parent',figure6);
box(axes6,'on');
hold(axes6,'all');
plot(time, request_count)
xlabel('Time');
ylabel('Request Count');
title('Request Count');

figure6 = figure('PaperSize',[20.98404194812 29.67743169791]);
axes6 = axes('Parent',figure6);
box(axes6,'on');
hold(axes6,'all');
y=sim_data(:,9);
plot(time, response_size)
xlabel('Time');
ylabel('Response Size');
title('Response Size');