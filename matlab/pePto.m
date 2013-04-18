% headers and data
% i.e. this many torrents were observed to have this many peers
raw = importdata('../data/pePto.txt', ',',1);
% #peers,frequency 
sorted = flipdim(sortrows(raw.data,2),1);
sorted = sorted(end:-1:1,:);

% find line of best fit: (10^intercept.*x.^slope);
[slope intercept r2 s] = logfit(sorted(:,1),sorted(:,2),0,'loglog');
model=@(x) (10^intercept)*x.^(slope);


peers = sorted(:,1)';
frequency = sorted(:,2)';
idx(cumsum([1 frequency(frequency>0)])) = 1;
expanded = peers(cumsum(idx(1:find(idx,1,'last')-1)));

mean_peers = mean(expanded);
median_peers = median(expanded);