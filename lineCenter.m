function [lc1,lc2,lc3] = lineCenter(Pa,Pb)
% The lineCenter function finds the center of a line between two points.
%
% INPUTS:   Pa  - the first set of points   - format [x y z]
%           Pb  - the second set of points  - format [x y z]
%
% EXAMPLE:  lineCenter([1,1,1],[3,3,3]) returns [2,2,2]

lc1 = (Pa(1) + Pb(1))/2;
lc2 = (Pa(2) + Pb(2))/2;
lc3 = (Pa(3) + Pb(3))/2;