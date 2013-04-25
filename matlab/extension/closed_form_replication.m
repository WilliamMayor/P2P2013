clear all;
addpath('../measurement');
pePto;

p=0.9;
r=5000;
n=5000000;
z=100;
c=0.05;

temp_p = 0;
u = 0;
while (temp_p < p);
    u = u + 1;
    k = (r-n*u*(1+z)/(c*n+u*z));
    t = 1;
    r_t1=floor(k*exp(-t*(c+u*z/n))+n*u*(1+z)/(c*n+u*z));
    t = 2;
    r_t2=floor(k*exp(-t*(c+u*z/n))+n*u*(1+z)/(c*n+u*z));
    r_t = [r r_t1];
    while (r_t1 ~= r_t2);
        r_t1 = r_t2;
        r_t = [r_t r_t1];
        t = t + 1;
        r_t2 = floor(k*exp(-t*(c+u*z/n))+n*u*(1+z)/(c*n+u*z));
    end
    temp_p = 1-(1-r_t1/n)^z;
end


fprintf('Torrents satisfied: %d%%\n', round(100*ccd(u)/ccd(1)));

index = find(sorted(:,1)==u,1);
percent = (sorted(index:end,1)'*sorted(index:end,2))/(sorted(:,1)'*sorted(:,2));
fprintf('Pairings satisfied: %d%%\n', round(100*percent));