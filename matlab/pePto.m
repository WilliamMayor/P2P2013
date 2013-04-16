% headers and data
% #torrents #peers
% i.e. this many torrents were observed to have this many peers
raw = importdata('/Users/william/Dropbox/Uni/Data/pePto.txt', ' ',1);
% #torrents # peers
sorted = flipdim(sortrows(raw.data,2),1);
% find line of best fit: (10^intercept.*x.^slope);
[slope intercept r2 s] = logfit(sorted(:,2),sorted(:,1),0,'loglog');

peers = sorted(:,2)';
torrents = sorted(:,1)';
idx([cumsum([1 torrents(torrents>0)])]) = 1;
expanded = peers(cumsum(idx(1:find(idx,1,'last')-1)));

mean_peers = mean(expanded);
median_peers = median(expanded);