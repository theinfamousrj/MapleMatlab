P = 10000;  %principle amount
r = 0.10;   %interest rate (decimal)
n = 4;      %number of times compounded per year
t = 10;     %number of years

m = n.*t;
j = r./n;
A = P.*(1+j).^m;

format bank

A