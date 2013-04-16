function[told] = totalTold(owners)
told = 1000;
z = 200;
n=1000000;
for i = 1:owners-1
    told = told + 1 + z/(1-(1-told/n)^z);
end
end