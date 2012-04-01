% RJ Hill

% Frequency gap between acoustical and optical

clear;
clc;

% Constants:

% set m1=m2 and explain for extra credit

m1 = 6.941E-3; 	% atomic mass of lithium (kg)
m2 = 3.545E-2;     % atomic mass of chlorine (kg)
a = sqrt((5.57E-10)/2);   % near neighbor distance for LiCl
C = atomicSpringConstant(a);
k = [0:0.1:pi/a];

% Optical and acoustic functions:
W1 = (m1+m2)*C/(m1*m2);
W2 = ((2*C^2)/(m1*m2)).*(1-cos(k.*a));

Wa = (W1 + (W1^2-W2).^(1/2)).^(1/2);
Wo = (W1 - (W1^2-W2).^(1/2)).^(1/2);

% Plot functions with title and end-points:
plot(k,Wa,'k-');
hold on
plot(k,Wo,'k-');

% Red circles denoting where the endpoints should be:
plot(pi/a,(2*C/m1)^(1/2),'ro');
plot(pi/a,(2*C/m2)^(1/2),'ro');

% Plot labels:
title('\omega vs. k for LiCl');
xlabel('k (in radians)');
ylabel('\omega (in 1/s)');