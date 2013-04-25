clear all;

paths = {
    '/Users/william/Desktop/simulations/cluster/complete/exp-large',...
    '/Users/william/Desktop/simulations/cluster/complete/exp-small',...
    '/Users/william/Desktop/simulations/cluster/complete/exp-xsmall',...
    '/Users/william/Desktop/simulations/cluster/complete/constant-large-churn',...
    '/Users/william/Desktop/simulations/cluster/complete/constant-med-churn',...
    '/Users/william/Desktop/simulations/cluster/complete/constant-small-churn'
};

for network_type = paths
    bottom_path = [network_type{1} '/' 'z100r1000/results.txt'];
    disp(bottom_path);
    
    results_import = importdata(bottom_path, ',',1);
    results_data = results_import.data;
    results_headers = results_import.colheaders;

    time = results_data(:,1);
    seeders = results_data(:,find(ismember(results_headers,' seeders')));
    leechers = results_data(:,find(ismember(results_headers,' leechers')));

    popularity = seeders + leechers;
    plot(popularity)
    hold all;
end