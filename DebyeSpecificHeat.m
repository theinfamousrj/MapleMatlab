function Cv = DebyeSpecificHeat(N,k,T,Td,Tde)

Xte = Tde./T;
Xt = Td./T;

for i=1:length(T);

func = @(x)(x.^4.*exp(x)./(exp(x)-1).^2);

func1 = quad(func,0,Xt(i));   
func2 = quad(func,0,Xte(i));

Cv(:,i) = 9*N*k.*(T(i)./Td).^3*func1;
Cve(:,i) = 9*N*k.*(T(i)./Tde).^3*func2;

end