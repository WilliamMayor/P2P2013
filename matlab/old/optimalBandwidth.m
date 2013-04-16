function r = optimalBandwidth(N,a,q)

tcp_overhead = 64;
bt_header = 51;
bt_overhead = 4;
bt_ip_overhead = 6;

x = 1:N;
query_send = ((tcp_overhead + bt_header)*q*log(1-a))./(a.*log(1-x./N));
query_receive = ((tcp_overhead + bt_overhead + bt_ip_overhead)*q*log(1-a))./(a.*log(1-x./N));
query = query_send + query_receive;
replication = x.*(tcp_overhead+bt_header);
total = query+replication;

%total = N.*((e*N*(2*tcp_overhead + bt_header + bt_overhead + e*bt_ip_overhead))./x + x.*(tcp_overhead+bt_header));

[~, i] = min(total);

r = x(i);
end