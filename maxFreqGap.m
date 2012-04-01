clear;
clc;

a=2.014E-10;              %m
ke2=14.4E-10;             %eV*A
cev=abs(-2*ke2/a^3);      %eV/m^2
c=cev*1.602E-19;          %J/m^2
m1=3.15475882E-26;        %Mass of Flouride in kg
m2=m1;%1.15258002E-26;        %Mass of Lithium in kg

k=0:0.1/a:pi/a;
wa=sqrt((c*(m1+m2)/(m1*m2))+sqrt((c*(m1+m2)/(m1*m2))^2-((2*c^2)/(m1*m2)*(1-cos(k*a)))));
wo=sqrt((c*(m1+m2)/(m1*m2))-sqrt((c*(m1+m2)/(m1*m2))^2-((2*c^2)/(m1*m2)*(1-cos(k*a)))));
plot(k,wa);
hold on
plot(k,wo);

plot(pi/a,sqrt((2*c)/m1),'ro');
plot(pi/a,sqrt((2*c)/m2),'ro');