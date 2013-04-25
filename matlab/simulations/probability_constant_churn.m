clear all;

paths = {
    '/Users/william/Desktop/simulations/cluster/complete/constant-large-churn',...
    '/Users/william/Desktop/simulations/cluster/complete/constant-med-churn',...
    '/Users/william/Desktop/simulations/cluster/complete/constant-small-churn'
};

for network_type = paths
    bottom_path = [network_type{1} '/' 'z100r1000/results.txt'];
    
    results_import = importdata(bottom_path, ',',1);
    results_data = results_import.data;
    results_headers = results_import.colheaders;

    awareness = results_data(:,ismember(results_headers,' awareness'));
    request_count = results_data(:,ismember(results_headers,' request_count'));
    
    properties_import = importdata([network_type{1} '/' 'z100r1000/simulation.properties'], '=');
    properties_data = properties_import.data;
    properties_headers = properties_import.rowheaders;

    n = properties_data(ismember(properties_headers, 'n'));
    z = properties_data(ismember(properties_headers, 'z'));

    probability = 1-(1-awareness/n).^z;
    fprintf('Average prob: %0.4f, average query repeat: %d\n', mean(probability), round(mean(request_count)/z));
    plot(probability)
    hold all;
end