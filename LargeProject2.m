% Large Project 2
% Max Heres
% Dr. Hasbun
% 4/23/2011
% Lithium
tic
clc
clear
format long

Kb=1.3806503E-23;           %kg*m^2/(K*s^2)
% V=;                       %Volume
BulkMod=11E9;               %bulk modulus  (Pa)
hbar=1.05457148E-34;        %m2*kg/s
N=6.0221415E23;             %Avogadros Number
ro=5300;                    %density of material at 20 °C  kg*m -3 
M=6.941;                    %g/mol
m=1.15258002E-26;           %Kg mass of atm
T=0:1:600;                  %K - temp
for i=1:length(T);

v=sqrt(BulkMod/ro);         % speed of sound in solid

%Wd=v(6*pi^2*N/V)^(1/3);
Wd=v*(6*pi^2*ro/m)^(1/3);

DebTempEx=344; %
DebTempTh= hbar*(Wd/Kb);
PercError=(DebTempEx-DebTempTh)*100/DebTempEx;   % error Debye temperature

XdEx=DebTempEx./T;        %
XdTh=DebTempTh./T;        %

fun = @(x)(x.^4.*exp(x)./(exp(x)-1).^2);
f1 = quad(fun,0,XdTh(i));   
f2 = quad(fun,0,XdEx(i));   
ClTh(:,i)= 9*N*Kb.*(T./DebTempTh).^3*f1;
ClEx(:,i)= 9*N*Kb.*(T./DebTempEx).^3*f2;


end

plot(T/343,ClTh)%,T/343,ClEx)
% plot(T/343,f1,T/343,f2)






toc