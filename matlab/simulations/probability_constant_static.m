clear all;

paths = {
    '/Users/william/Desktop/simulations/cluster/complete/constant-large-static',...
    '/Users/william/Desktop/simulations/cluster/complete/constant-med-static',...
    '/Users/william/Desktop/simulations/cluster/complete/constant-small-static'
};

for network_type = paths
    bottom_path = [network_type{1} '/' 'z100r1000/results.txt'];
    
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
    average_awareness_change = mean(abs(diff(awareness(5:450))));
    fprintf('Probability drop by %.4f from %.4f to %.4f. Average awareness change %i\n', probability(5)-probability(450),probability(5), probability(450),round(average_awareness_change));
    plot(probability)
    hold all;
end