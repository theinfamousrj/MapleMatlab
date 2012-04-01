function D = DensityOfStates(v,V,W)

D = (V.*W.^2)./(2.*pi.^2.*v.^3);