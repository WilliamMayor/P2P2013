clc;
clear all;

z = 500;
N = 5000000;
b = 5000;

disp(['z = ' num2str(z)]);
disp(['N = ' num2str(N)]);
disp(['bootstrap = ' num2str(b)]);

disp('#searches | #known by | P(d) | z, P(d)=0.5 | z, P(d)=0.8 | z, P(d)=0.95');
for i = [1 2 3 4 5 6 11 101 1001]
    kb = s(i,z,N,b);
    p = 1-(1-kb/N)^z;
    z5 = log(1-0.5)/log(1-kb/N);
    z8 = log(1-0.8)/log(1-kb/N);
    z95 = log(1-0.95)/log(1-kb/N);
    disp([num2str(i) ' ' num2str(kb, '%.0f') ' (' num2str(100*kb/N, '%.2f') '%) ' num2str(p*100, '%.0f') ' ' num2str(z5, '%.0f') ' ' num2str(z8, '%.0f') ' ' num2str(z95, '%.0f')]);
end

for dp = [0.5 0.8 0.9 0.95]
    cp = 0;
    r = 0;
    while (cp < dp)
        r = r + 1;
        kb = s(r,z,N,b);
        %kb = z*r;
        cp = 1-(1-kb/N)^z;
    end
    disp(['For p=' num2str(dp) ' we need ' num2str(r) ' requests']);
end