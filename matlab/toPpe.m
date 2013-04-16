clear all;
% headers and data
% #peers #torrents
% i.e. this many peers were observed to have this many torrents
raw = importdata('../data/toPpe.txt', ' ',1);
% #torrents # peers
sorted = flipdim(sortrows(raw.data,2),1);
sorted = sorted(end:-1:1,:);
