% headers and data
% #peers #torrents
% i.e. this many peers were observed to have this many torrents
raw = importdata('../data/toPpe.txt', ' ',1);
% #torrents # peers
toPpe = flipdim(sortrows(raw.data,2),1);
toPpe = toPpe(end:-1:1,:);
