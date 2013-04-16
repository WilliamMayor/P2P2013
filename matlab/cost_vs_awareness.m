clear all;
constants;
q = 500; % 500 requests made for this torrent every hour
% Made assumption that details of single node will be sent back

a = accuracy(3);
x = 1:n;
send = ((64+51)*q*log(1-a))./(a.*log(1-x./n));
receive = ((64 + 51 + 4 + 6)*q*log(1-a))./(a.*log(1-x./n));
query = send + receive;
replication = x.*(64+51);
total = query+replication;

domain = 100000:130000;
plot(domain, query(domain),'DisplayName','query','YDataSource','query');
hold all;
plot(domain, replication(domain),'DisplayName','replication','YDataSource','replication');
plot(domain, total(domain),'DisplayName','total','YDataSource','total');
legend('query','replicate','total');
xlabel('#nodes aware of torrent');
ylabel('bandwidth required');
hold off;
figure(gcf);