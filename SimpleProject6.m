% RJ Hill

clc;
clear;

% for NaF
% Constants
q = 4.80325e-10;                % in esu
p = 0.29e-10;                   % in meters
z = 0.641e-8;                   % in ergs
a = 1.747;                      % the madelung constant alpha
x = [0:0.1:15];                 % Array for the x-values in plot
Na = 6.022e23                   % avagadro's number
ergToKcal = 1/(1e7*4.184e3);    % Conversion from ergs to KCal

% Equations
c = ((q.^2).*a)/(p.*z)
f = x.^2.*exp(-x);

% Calculations
X = FZERO('x.^2.*exp(-x)-0.0217',7)
R = X.*p
U = ((Na.*((q.^2).*a))/2.3159e-8).*(1-(1/X))*ergToKcal   %In KCal/molecule

plot(x,f);

Re=((2.317e-10-R)/2.317e-10).*100

Ue=((U-215.2)/215.2).*100
