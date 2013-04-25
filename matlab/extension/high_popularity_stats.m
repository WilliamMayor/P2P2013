clear all;
addpath('..');
constants;

disp('Reach 80% when x is:');
required_x = ones(size(z));
for i = 1:size(z,2)
    idx = find(probability(:,i)>0.95,1);
    required_x(i) = idx;
    fprintf('    z=%d, r(1)=%d, x=%d\n', z(i), r_1(i), idx);
end
idx = max(required_x);

fprintf('If %d popularity:\n', idx)
for z = 100:-1:1
    awareness = ones(idx,1)*r_1(1);
    for i = 2:size(awareness,1)
        awareness(i) = awareness(i-1) + 1 + z.*(1-awareness(i-1)./n)./(1-(1-awareness(i-1)./n).^z);
    end
    probability = 1-(1-awareness(idx)/n)^z;
    if (probability < 0.5)
        fprintf('    P(d)=0.5 => z=%d, r(1)=%d, r(%d)=%d\n', z, r_1(1), idx, awareness(idx));
        break;
    end
end