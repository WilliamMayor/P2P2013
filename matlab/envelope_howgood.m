%if u searches are run every hour then:
%  y% of the torrents observed are discoverable after h hours, 
%  100% after i hours

clear all;
clc;
pePto;

p=0.9;
z=100;
n=5000000;
r=5000;
c=0.05;

u=58;
h=10;

required_r = (1-exp(log(1-p)/z))*n;
asymptote = u*n*(1+z)/(c*n + u*z);
leaway = asymptote - required_r;

torrent_success = 0;
query_success = 0;

% for i=1:size(sorted,1);
%     peer_count = sorted(i,1);
%     frequency = sorted(i,2);
%     t=1;
%     r_t=peer_count;
%     k = (r-n*u*(1+z)/(c*n+u*z));
%     while (r_t < required_r && t < h);
%         t = t + 1;
%         r_t=floor(k*exp(-t*(c+u*z/n))+n*u*(1+z)/(c*n+u*z));
%     end
%     if (r_t >= required_r);
%         torrent_success = torrent_success + frequency;
%         query_success = query_success + frequency*peer_count;
%     end
% end

torrent_success_proportion = torrent_success / sum(sorted(:,2));
query_success_proportion = query_success / sum(sorted(:,1)'*sorted(:,2));

t=1;
previous = 0;
k = (r-n*u*(1+z)/(c*n+u*z));
r_t=floor(k*exp(-t*(c+z/n))+n*(1+z)/(c*n+z));
while (r_t < required_r && r_t ~= previous);
    previous = r_t;
    t = t + 1;
    r_t=floor(k*exp(-t*(c+u*z/n))+n*u*(1+z)/(c*n+u*z));
end
if (r_t == previous);
    t = -1;
end