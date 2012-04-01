%Brian Hubbard
%Simple project
%The purpose of this program is to show the ionization potential for Copper
%(Cu) versus the separation distance (R). 


clc;
clear;

%***constants***:
E = 167.*10.^-16;         % Energy for copper in ergs
Sigma = 3.40;             % Sigma value for Cu in Angstroms
Ep = E.*6.2415.*10.^-11;  % convert ergs to eV
NN = Sigma*(2^(1/6));     % NN radius found from Fig. 6 pg 58

%***Equations***:
R = [0.9.*Sigma:.01:2*NN];  
U = 4*Ep.*((Sigma./R).^12-(Sigma./R).^6); %Potential

%***plot***
plot(R,U,'b')
xlabel('R in Angstroms')
ylabel('U in eV')
title('Leonard-Jones Potential of Copper')