clear all;
constants;

result_limit = [1 10 100];

cost_send = 64 + 51;
cost_unsuccessful = 64 + 4;
cost_successful = 64 + 4 + 6.*result_limit;

hits_per_query = z'*awareness(x)./n;
miss_per_query = (z' * (ones(size(hits_per_query,2),1))') - hits_per_query;

results_one = cost_send + ...
              cost_unsuccessful*miss_per_query + ...
              cost_successful(1)*hits_per_query;
results_ten = cost_send + ...
              cost_unsuccessful*miss_per_query + ...
              cost_successful(2)*hits_per_query;
results_hun = cost_send + ...
              cost_unsuccessful*miss_per_query + ...
              cost_successful(3)*hits_per_query;
          
colheadings = {'z','r(1)','x','r(x)','latest','top-10','top-100'}; 
rowheadings = {};
data_x = repmat(x,[size(z,2) 1]);
data_x = data_x(:);
data = [repmat(z', size(x,2), 1) ...
        repmat(r_1', size(x,2), 1) ...
        data_x ...
        ceil(reshape(awareness(x,:).',[],1)) ...
        ceil(results_one(:)) ...
        ceil(results_ten(:)) ...
        ceil(results_hun(:))];

colsep = ' & '; 
rowending = ' \\';
wid = 11; 
fms = {'d','d','d','d','d','d','d'};
fileID = 1;

displaytable(data,colheadings,wid,fms,rowheadings,fileID,colsep,rowending); 


