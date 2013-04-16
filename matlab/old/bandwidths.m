clear all;

n = 5000000;
q = 500;
z = [100 500 1000];
b = [1000 5000 5000];

tcp_overhead = 64;
bt_header = 51;
bt_overhead = 4;
bt_ip_overhead = 6;

x = 1:21000;
a = ones(size(x,2),3);
a(1,:) = b+1;
for i = 2:size(a,1)
    for j=1:3
        a(i,j) = a(i-1,j) + 1 + z(j)*(1-a(i-1,j)/n)*(1/(1-(1-a(i-1,j)/n)^z(j)));
    end
end

% INDIVIDUAL TRAFFIC FOR SINGLE QUERY
% query = ones(n,3);
% for i=1:3
%     query_send = z(i)*(64 + 51);
%     query_receive = z(i).*(64 + 4 + 6.*x.*a./n);
%     query(:,i) = query_send + query_receive;
% end
% 
% return;



% TOTAL TRAFFIC FOR SINGLE TORRENT
x = 1:n;
query_send = ((tcp_overhead + bt_header)*q*log(1-a))./(a.*log(1-x./n));
query_receive = ((tcp_overhead + bt_overhead + bt_ip_overhead)*q*log(1-a))./(a.*log(1-x./n));
query = query_send + query_receive;
replication = x.*(tcp_overhead+bt_header);
total = query+replication;

domain = 93829:133829;
plot(domain, query(domain),'DisplayName','query','YDataSource','query');
hold all;
plot(domain, replication(domain),'DisplayName','replication','YDataSource','replication');
plot(domain, total(domain),'DisplayName','total','YDataSource','total');
legend('query','replicate','total');
xlabel('#nodes aware of torrent');
ylabel('bandwidth required');
hold off;
figure(gcf);
