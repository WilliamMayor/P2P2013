clear all;

path_standard = '/Users/william/Desktop/simulations/cluster/complete/exp-small';
   path_flash = '/Users/william/Desktop/simulations/cluster/complete/exp-small-flash';
    path_long = '/Users/william/Desktop/simulations/cluster/complete/exp-small-long';

for network_type = {path_standard, path_flash, path_long}
    bottom_path = [network_type{1} '/' 'z100r1000/results.txt'];
    disp(bottom_path);
    
    results_import = importdata(bottom_path, ',',1);
    results_data = results_import.data;
    results_headers = results_import.colheaders;

    time = results_data(:,1);
    seeders = results_data(:,ismember(results_headers,' seeders'));
    leechers = results_data(:,ismember(results_headers,' leechers'));

    popularity = seeders + leechers;
    plot(popularity)
    hold all;
end

