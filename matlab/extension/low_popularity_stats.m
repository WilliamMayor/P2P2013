clear all;
constants;

colheadings = {'z','r(1)','x', 'P(d_i)', 'Query Count'};
rowheadings = {};
wid = 11;
fms = {'d', 'd', 'd', '.5f', '.2f'};
colsep = ' & ';
rowending = ' \\';
fileID = 1;

data = ones(20, 5);
for i = 1:size(z,2)
    for x = 1:5
        data(5*(i-1)+x, :) = [z(i) r_1(i) x probability(x, i) 1/probability(x,i)];
    end
end

displaytable(data,colheadings,wid,fms,rowheadings,fileID,colsep,rowending);