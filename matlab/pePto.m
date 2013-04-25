% headers and data
% i.e. this many torrents were observed to have this many peers
raw = importdata('../data/pePto.txt', ',',1);
% #peers,frequency 
sorted = flipdim(sortrows(raw.data,1),1);
sorted = sorted(end:-1:1,:);

a = 1+size(sorted,1)/sum(log(sorted(:,2)));
model=@(x) (a-1)*x.^(-a);
ccd = @(x) x.^(-a+1);


peers = sorted(:,1)';
frequency = sorted(:,2)';
clear idx;
idx(cumsum([1 frequency(frequency>0)])) = 1;
expanded = peers(cumsum(idx(1:find(idx,1,'last')-1)));

mean_peers = mean(expanded);
median_peers = median(expanded);

%loglog(sorted(:,1), sorted(:,2)/sum(sorted(:,2)), sorted(:,1), model(sorted(:,1)))