clear all;

c=0.06;
n=5000000;
p=0.9;

u=@(x) (x*exp(log(1-p)/x)-1)/(c*n*(1-exp(log(1-p)/x)));

y=zeros(500,3);
for i=1:size(y,2);
    for x=1:size(y,1);
        y(x,i) = (c*n*(1-exp(log(1-p)/x)))/(x*exp(log(1-p)/x)-1);
    end
    c = c + 0.1;
end
plot(y)
