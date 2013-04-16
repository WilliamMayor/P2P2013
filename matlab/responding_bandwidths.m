clear all;
constants;
pePto;

%using average
requests_hour = q.*z./(1-(1-awareness(round(mean_peers),:)./n).^z);
bandwidth_one = requests_hour*(64 + 4 + 6*1)/60/60;
bandwidth_ten = requests_hour*(64 + 4 + 6*10)/60/60;
bandwidth_hun = requests_hour*(64 + 4 + 6*100)/60/60;

colheadings = {'z','r(1)','#queries/hour','a=1','a=10','a=100'}; 
rowheadings = {};
data = [z' r_1' round(requests_hour') round(bandwidth_one') round(bandwidth_ten') round(bandwidth_hun')];

colsep = ' & '; 
rowending = ' \\';
wid = 11; 
fms = {'d','d','d','d','d','d'};
fileID = 1;

displaytable(data,colheadings,wid,fms,rowheadings,fileID,colsep,rowending); 

%using median
requests_hour = q.*z./(1-(1-awareness(round(median_peers),:)./n).^z);
bandwidth_one = requests_hour*(64 + 4 + 6*1)/60/60;
bandwidth_ten = requests_hour*(64 + 4 + 6*10)/60/60;
bandwidth_hun = requests_hour*(64 + 4 + 6*100)/60/60;

colheadings = {'z','r(1)','#queries/hour','a=1','a=10','a=100'}; 
rowheadings = {};
data = [z' r_1' round(requests_hour') round(bandwidth_one') round(bandwidth_ten') round(bandwidth_hun')];

colsep = ' & '; 
rowending = ' \\';
wid = 11; 
fms = {'d','d','d','d','d','d'};
fileID = 1;

displaytable(data,colheadings,wid,fms,rowheadings,fileID,colsep,rowending); 
