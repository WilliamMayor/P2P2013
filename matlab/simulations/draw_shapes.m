%#ok<*FNDSB>
%#ok<*LAXES>
clear all;

top_path = '/Users/william/Desktop/simulations/cluster/complete/';
network_types = dir(strcat(top_path, '*'));
for network_type = network_types'
    bottom_path = strcat(top_path, network_type.name, '/');
    pac_types = dir(strcat(bottom_path, '*'));
    for pac_type = pac_types'
        try
            disp(strcat(bottom_path, pac_type.name));
            results_import = importdata(strcat(bottom_path, pac_type.name, '/results.txt'), ',',1);
            results_data = results_import.data;
            results_headers = results_import.colheaders;

            time = results_data(:,1);
            awareness = results_data(:,find(ismember(results_headers,' awareness')));
            seeders = results_data(:,find(ismember(results_headers,' seeders')));
            leechers = results_data(:,find(ismember(results_headers,' leechers')));
            bad_data = results_data(:,find(ismember(results_headers,' bad_data')));
            left = results_data(:,find(ismember(results_headers,' left')));
            joined = results_data(:,find(ismember(results_headers,' joined')));
            response_size = results_data(:,find(ismember(results_headers,' response_size')));
            request_count = results_data(:,find(ismember(results_headers,' request_count')));

            properties_import = importdata(strcat(bottom_path, pac_type.name, '/simulation.properties'), '=');
            properties_data = properties_import.data;
            properties_headers = properties_import.rowheaders;

            n = properties_data(find(ismember(properties_headers, 'n')));
            z = properties_data(find(ismember(properties_headers, 'z')));
            
            figure1 = figure('Visible','off');
            draw(time, seeders + leechers, 'Time', 'Popularity', 'popularity over time', strcat(bottom_path, pac_type.name, '/popularity.eps'), figure1);
            clf;
            draw(time, 1-(1-awareness/n).^z, 'Time', 'Probability of successful query', 'Probability of successful query over time', strcat(bottom_path, pac_type.name, '/probability.eps'), figure1);
            clf;
            draw(time, leechers, 'Time', 'Leechers', 'leechers over time', strcat(bottom_path, pac_type.name, '/leechers.eps'), figure1);
            clf;
            draw(time, seeders, 'Time', 'Seeders', 'seeders over time', strcat(bottom_path, pac_type.name, '/seeders.eps'), figure1);
            clf;
            draw(time, awareness, 'Time', 'Awareness', 'awareness over time', strcat(bottom_path, pac_type.name, '/awareness.eps'), figure1);
            clf;
            draw(time, bad_data, 'Time', 'Bad Data', 'bad data over time', strcat(bottom_path, pac_type.name, '/bad_data.eps'), figure1);
            clf;
            draw(time, joined, 'Time', 'Joined', 'Number of peers joining torrent at a given hour', strcat(bottom_path, pac_type.name, '/joining.eps'), figure1);
            clf;
            draw(time, left, 'Time', 'Left', 'Number of peers leaving the torrent at a given hour', strcat(bottom_path, pac_type.name, '/leaving.eps'), figure1);
            clf;
            draw(time, request_count, 'Time', 'Request Count', 'Average number of requests required before success', strcat(bottom_path, pac_type.name, '/request_count.eps'), figure1);
            clf;
            draw(time, response_size, 'Time', 'Response Size', 'Average size of result set per request', strcat(bottom_path, pac_type.name, '/response_size.eps'), figure1);
            clf;
            
        catch e
            if strcmp(e.identifier, 'MATLAB:importdata:FileNotFound')

            else
                disp(e)
            end
        end
    end
end
