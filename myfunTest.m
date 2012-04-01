clear;
clc;

m=1;
n=2;

Q = quad(@myfun,m,n)

z = 0.5*n^2 - 0.5*m^2