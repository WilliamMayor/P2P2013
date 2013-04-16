clear all;

n = 5000000;
z = 1000;
b = 5000;
q = 1.33;

raw = importdata('/Users/william/Dropbox/Uni/Data/pePto.txt', ' ',1);
sorted = flipdim(sortrows(raw.data,2),1);

x = 1:21000;
aware = ones(size(x,2),1);
aware(1) = b+1;
for i = 2:size(aware,1)
    aware(i) = aware(i-1) + 1 + z*(1-aware(i-1)/n)*(1/(1-(1-aware(i-1)/n)^z));
end

total = 0;
count = 0;
for i = 1:size(sorted,1)
    torrents = sorted(i,1);
    peers = sorted(i,2);
    total = total + torrents*(68 + 6*peers*aware(peers)/n);
    count = count + torrents;
end

avg = total/count
(1.33*z*avg)/1000

total = 0;
for i = 1:size(sorted,1)
    torrents = sorted(i,1);
    peers = sorted(i,2);
    %z(64 + 51) + z(64 + 4 + 6x)
    total = total + torrents*z*(64+51+64+4+6*peers)/(1-(1-aware(peers)/n)^z);
end
(n*q*total/count)/10^12