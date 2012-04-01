%RJ Hill

clc
clear

format long

Z = 23;                     %Z-value for Vanadium
a = 3.03;                   %a=3.03
r = ((3*a^3)/(8*pi))^(1/3); %bcc (a^3)/2

t0=0;
ts=15;
tm=90;
theta = [t0:ts:tm];         %range for theta
lambda = [5:1:500];         %range for lambda


for i=1:tm/ts
    % calculating G(i) with theta and ?
    G(i,:) = (4*pi*sind(theta(i))./lambda);
    
    % calculating F(i) with Z, G and r
    F(i,:) = Z.*(1-(((G(i,:).^2).*r.^2)/10));
    
    plot(1./lambda,F(i,:));
    title('Atomic Form Factor for Vanadium');
    xlabel('1/\lambda (1/Å)');
    ylabel('Form Factor (F_j)');
    hold on
end