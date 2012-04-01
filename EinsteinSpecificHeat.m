function Cve = EinsteinSpecificHeat(N,k,h,Wd,T)

t = T.*k;

Cve = 3*N*k*(h*Wd./t).^2.*exp(h*Wd./t)./(exp(h*Wd./t)-1).^2;