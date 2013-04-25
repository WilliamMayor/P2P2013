clear all;

paths = {
    '/Users/william/Desktop/simulations/cluster/complete/exp-xsmall-flash',...
    '/Users/william/Desktop/simulations/cluster/complete/exp-small-flash',...
    '/Users/william/Desktop/simulations/cluster/complete/exp-large-flash'
};

for network_type = paths
    bottom_path = [network_type{1} '/' 'z100r1000/results.txt'];
    disp(bottom_path);
    
    results_import = importdata(bottom_path, ',',1);
    results_data = results_import.data;
    results_headers = results_import.colheaders;

    awareness = results_data(:,ismember(results_headers,' awareness'));
    
    properties_import = importdata([network_type{1} '/' 'z100r1000/simulation.properties'], '=');
    properties_data = properties_import.data;
    properties_headers = properties_import.rowheaders;

    n = properties_data(ismember(properties_headers, 'n'));
    z = properties_data(ismember(properties_headers, 'z'));

    probability = 1-(1-awareness/n).^z;
    plot(probability)
    hold all;
end