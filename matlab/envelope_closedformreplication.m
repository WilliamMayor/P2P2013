clear all;

r=50000;
n=5000000;
u=10;
z=100;
c=0.05;

k=(r-n*u*(1+z)/(c*n+u*z));

if (-k > 0);
   disp('Increasing'); 
else
   disp('Decreasing'); 
end

x=0:1000;
y=k*exp(-x*(c+u*z/n))+n*u*(1+z)/(c*n+u*z);

p = 1-(1-y(end)/n)^z;

plot(y);
figure(gcf);