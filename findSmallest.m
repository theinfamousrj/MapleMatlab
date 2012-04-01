function smallest = findSmallest(array)

n = size(array);
smallest = array(1);

for i=2:n(2)
    if (array(i) < smallest)
        smallest = array(i);
    end
end