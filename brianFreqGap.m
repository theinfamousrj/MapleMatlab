%This simple project will reproduce the graph in the notes that shows the
%optic and the acoustic branches of the phonons.

%For this we will use NaCl which is an FCC structure
%***Constants***
a=5.6e-10;  %in A
k=1.38e-23;
e=1.602e-19;
c=(2*k*e^2)/a^3; % spring constant
m1=2.298976928e-26; %Mass of sodium in amu
m2=3.545e-26;       %mass of Chlorine in amu
k=[0:0.1/a:pi/a];  %Array for k values
mm=m1.*m2;
mpm=m1+m2;
%***Equations***
wsp=((c*mpm)/mm+(((c*mpm)/mm).^2-((2*c.^2./mm)*(1-cos(k*a)))).^(1/2)).^(1/2);
wsm=((c*mpm)/mm-(((c*mpm)/mm).^2-((2*c.^2./mm)*(1-cos(k*a)))).^(1/2)).^(1/2);



hold on
plot(k,wsm);
plot(k,wsp);
