function awareness = s(owners,z,N,base)
awareness = base+1;
for x = 1:owners-1
    awareness = awareness + 1 + z*(1-awareness/N)/(1-(1-awareness/N)^z);
end
end