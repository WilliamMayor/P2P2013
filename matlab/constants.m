% popularity domain
popularity = 1:21000;

% possible z values
z = [100 500 500 1000];

% r(1) values corresponding to z
r_1 = [1000 1000 5000 5000];

% query rate
q = 1.33;

% number of nodes in network
n = 5000000;

% selection of possible popularities
x = [1 10 100 1000 10000];

accuracy = [0.5 0.8 0.9 0.95];

% awareness
awareness = ones(size(popularity,2),size(z,2));
awareness(1,:) = r_1+1;
for i = 2:size(awareness,1)
    awareness(i,:) = awareness(i-1,:) + 1 + z.*(1-awareness(i-1,:)./n)./(1-(1-awareness(i-1,:)./n).^z);
end