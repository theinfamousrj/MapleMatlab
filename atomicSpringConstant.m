function k = atomicSpringConstant(a)

Na = 6.022E23;      % in 1/mol
B = 2.98;           % in N/m^2
p = 2.068E6;          % in g/m^3
m = 42.394;         % in g/mol
k = (B*m*Na)/(p*a^2);

% ke = 14.4;          % in eV*A
% Ce = (2*ke)/(a^3);  % in eV/A^2
% C = Ce*1.602E-19;   % in J/A^2