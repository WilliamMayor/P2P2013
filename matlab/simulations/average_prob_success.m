%#ok<*FNDSB>
%#ok<*LAXES>
clear all;
allaverage = [];
top_path = '/Users/william/Desktop/simulations/cluster/complete/';
network_types = dir(strcat(top_path, '*'));
for network_type = network_types'
    bottom_path = strcat(top_path, network_type.name, '/');
    pac_types = dir(strcat(bottom_path, '*'));
    for pac_type = pac_types'
        try
            results_import = importdata(strcat(bottom_path, pac_type.name, '/results.txt'), ',',1);
            results_data = results_import.data;
            results_headers = results_import.colheaders;

            %time = results_data(:,1);
            awareness = results_data(:,find(ismember(results_headers,' awareness')));
            %seeders = results_data(:,find(ismember(results_headers,' seeders')));
            %leechers = results_data(:,find(ismember(results_headers,' leechers')));
            %bad_data = results_data(:,find(ismember(results_headers,' bad_data')));
            %left = results_data(:,find(ismember(results_headers,' left')));
            joined = results_data(:,find(ismember(results_headers,' joined')));
            %response_size = results_data(:,find(ismember(results_headers,' response_size')));
            %request_count = results_data(:,find(ismember(results_headers,' request_count')));

            properties_import = importdata(strcat(bottom_path, pac_type.name, '/simulation.properties'), '=');
            properties_data = properties_import.data;
            properties_headers = properties_import.rowheaders;

            n = properties_data(find(ismember(properties_headers, 'n')));
            z = properties_data(find(ismember(properties_headers, 'z')));
            
            probability = 1-(1-awareness/n).^z;
            
            average = probability'*joined/sum(joined);
            allaverage = [allaverage average];
            disp(strcat(bottom_path, pac_type.name));
            fprintf('    Average probability to find: %.5f\n', average);
            
        catch e
            if strcmp(e.identifier, 'MATLAB:importdata:FileNotFound')

            else
                disp(e)
            end
        end
    end
end
