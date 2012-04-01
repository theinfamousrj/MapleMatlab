% RJ Hill
% Simple Project

clear;
clc;

% constants:
E = 167e-16;            % value for Argon (in ergs)
Sg = 3.40;              % value for Argon (in A)
Ep = E*6.24150974e-11;  % 1 erg = 6.24150974 × 10^11 eV

% variables:
Rnn = Sg*(2^(1/6));     % nearest neighbor radius
R = [.95*Sg:.001:2*Rnn];% R from Sg to Rnn step size of .001
U = 4*Ep.*((Sg./R).^12-(Sg./R).^6);

%plot:
plot(R,U,'Linewidth',2,'Color','black')
xlabel('R (in A)')
ylabel('U (in eV)')
title('Ionization Potential of Argon')