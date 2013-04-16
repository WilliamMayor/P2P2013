if ~exist('raw','var')
    trial_count = 14;
    raw = ones(5000000,trial_count)*5000000;
    model = ones(5000000,1)*5000000;
    for i = 1:trial_count
        disp(['Loading: ' '/Users/william/Desktop/awareness/awareness' int2str(i) '.txt']);
        [rows , ~, ~] = importdata(['/Users/william/Desktop/awareness/awareness' int2str(i) '.txt'],' ',3);
        raw(1:size(rows.data,1),i) = rows.data;
    end
    disp('Taking average');
    mean_raw = mean(raw, 2);
    disp('Building model');
    z = 926;
    N = 5000000;
    bootstrap = 4630;
    model(1) = bootstrap + 1 + z*(1-bootstrap/N)/(1-(1-bootstrap/N)^z);
    for i = 2:5000000        
        model(i) = model(i-1) + 1 + z*(1-model(i-1)/N)/(1-(1-model(i-1)/N)^z);
    end
end

range = 1:10000;
figure;
plot(range,model(range),'', range,mean_raw(range),'')
legend('model','simulation');
xlabel('#nodes that own the torrent');
ylabel('#nodes that are aware of the torrent');
mean((mean_raw - model).^2)