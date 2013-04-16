clear all;
location='/Users/william/Desktop/simulations/shapes/constant-large-churn/z100r1000/simulation.properties';
d=importdata(location, '=');
cell2struct(d.data', d.rowheaders',1);