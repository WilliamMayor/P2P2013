% popularity domain
popularity = 1:21000;

time = 1:200;
initial_query_volume = 50;
query_attenuation = 0.02;
surviving_node_proportion = 1-0.2;

% possible z values
z = [50 100 500];

% r(1) values corresponding to z
r_1 = [5000 5000 5000];

% number of nodes in network
n = 5000000;

% selection of possible popularities
x = [1 10 100 1000 10000];

accuracy = [0.5 0.8 0.9 0.95];

% awareness
awareness = ones(size(time,2),size(z,2));
awareness(1,:) = r_1+1;
for i = 2:size(awareness,1)
    %awareness(i,:) = initial_query_volume*exp(-(i-1)*query_attenuation)*(1+z.*(1-awareness(i-1,:)./n)./(1-(1-awareness(i-1,:)./n).^z)) + surviving_node_proportion*awareness(i-1,:);
    awareness(i,:) = 1*(1+z.*(1-awareness(i-1,:)./n)./(1-(1-awareness(i-1,:)./n).^z)) + surviving_node_proportion*awareness(i-1,:);
end

%probability
probability = ones(size(time,2),size(z,2));
for i = 1:size(z,2)
    probability(:,i) = 1-(1-awareness(:,i)./n).^z(i);
end

required_z = ones(size(time,2),size(accuracy,2));
r = ones(size(time,2)+1,size(accuracy,2));
%r(1,:) = n*(1-exp(log(1-accuracy)./100));
q = 100;
r(1,:) = r(1,:)*10000;
for i = 1:size(required_z,1)
    required_z(i,:) = log(1-accuracy)./log(1-r(i,:)./n);
    %r(i+1,:) = initial_query_volume*exp(-(i-1)*query_attenuation)*(1+required_z(i,:).*(1-r(i,:)./n)./(1-(1-r(i,:)./n).^required_z(i,:))) + surviving_node_proportion*r(i,:);
    r(i+1,:) = q*(1+required_z(i,:).*(1-r(i,:)./n)./(1-(1-r(i,:)./n).^required_z(i,:))) + surviving_node_proportion*r(i,:);
end

queries_made = initial_query_volume*exp(-time*query_attenuation);
average_z = queries_made*required_z/sum(queries_made);