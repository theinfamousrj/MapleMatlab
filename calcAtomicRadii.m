function [R,V] = calcAtomicRadii(length,width,height,type)

if (type == 0)
    a = [length width height]
    s = findSmallest(a)
    R = s/2
end

if (type == 1)
    
end

if (type == 2)
    
end

if (type == 3)
    
end

R = int2str(R);

V = (4/3)*pi*((R^3)/8);
V = int2str(V)