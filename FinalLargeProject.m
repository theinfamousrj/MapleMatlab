% RJ Hill
% Larger project

clc;
clear;
warning('off','all');

%% Constants
% The constants used in the program.

% Universal Constants:
N = 6.0221415e23;       %Avogadros Number (in 1/mol)
k = 1.3806503e-23;      %Boltzmann constant (in kg*m^2/K*s^2)
h = 1.0545716e-34;      %h-Bar (in kg*m^2/s)

% Silicon Constants:
B = 100e9;              %Bulk modulus of Silicon (in Pa)
p = 2330;               %Density of Silicon (in kg/m^3)
M = 0.02809;            %Molar mass of Silicon (in kg/mol)
% Ma = 28.0855;         %Atomic mass of Silicon (in amu)

% Debye Constants:
Tde = 645;              %Experimental Debye temperature (in K)

% Conversion Factors:
% a2kg = 1.66053886e-27;%Conversion from amu to kg


%% Calculations
% The calculations for mass, speed of sound, debye temp, & dulong petite
% law.

% Mass calculation:
% Although it isn't far, my program calculates the mass of silicon to be
% 4.6645e-26 kg, which is pretty close to 4.66370642e-26 kg.
m = M/N;                %Mass of Silicon (in kg)
% m2 = Ma*a2kg;         %Mass of Silicon (in kg)

% Speed of sound calculation:
S = sqrt(B/p);          %Speed of sound in Silicon (in m/s)

% Volume calculation:
V = m/p;                %Unit cell volume in Silicon (in m^3)

% Debye temperature calculation:
% Again, I did another test, the molar mass gives us 2.0516K and the
% atomic mass calculation gives us 2.0518K.
hk = h/k;                   %First part of the Debye temperature (in K*s)
Wd = S*(6*pi^2*(p/m))^(1/3);%Debye frequency (in 1/s)
Td = hk*Wd;                 %Debye temperature for Silicon (in K)
ETd = ((Tde-Td)/Tde);       %Debye temperature error (in fraction not percent)


% Dulong Petite calculation:
DlPe = 3*N*k;


%% Variables
% The variables for the program.

T = 0:0.005*Td:2*Td;         %Range of temperatures (in K)


%% Plots
% The plots for the program.
Wdd = [0:Wd/100:Wd];
Cv = DebyeSpecificHeat(N,k,T,Td,Tde);
Cve = EinsteinSpecificHeat(N,k,h,Wd,T);
D = DensityOfStates(S,V,Wdd);

subplot(2,1,1),plot(T/Td,Cv,'k-')
hold on
subplot(2,1,1),plot(T/Td,DlPe,'r-')
hold on

subplot(2,1,1),plot(T/Td,Cve,'b-')
subplot(2,1,1),title('Experimental Debye C_v & Experimental Einstein C_v')
subplot(2,1,1),xlabel('Temperature/Debye Temperature')
subplot(2,1,1),ylabel('C_v')
hold on

subplot(2,1,2),plot(Wdd,D,'k-')
subplot(2,1,2),title('Density of States vs. Debye Frequency')
subplot(2,1,2),xlabel('\omega')
subplot(2,1,2),ylabel('D(\omega)')