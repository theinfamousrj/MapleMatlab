%If alpha=90, beta=90, and gamma=90, and given that a=1 angstrom, b=1.5 angstroms,
%and c=2 angstroms, find an atom's x, y, z coordinates in this orthorhombic crystal
%if its position vector interms of the original a, b, c vectors is given by the
%vector t=3(vector a)+4(vector b)-3(vector c). Note that the magnitudes of the
%vectors a, b and c are given only and not their directions.

clc
close all
clear
format compact

%angstroms
a = 1.0;
b = 1.5;
c = 2.0;

%degrees
alpha = 90;
beta  = 90;
gamma = 90;

%Define c1, c2, and c3 to compose the C matrix
c1 = c*cosd(beta);
c2 = c*(cosd(alpha)-cosd(gamma)*cosd(beta))/(sind(gamma));
c3 = sqrt((c^2 - (c1)^2 - (c2)^2));
C  = [[a b*cosd(gamma) c1];[0 b*sind(gamma) c2];[0 0 c3 ]]; %C matrix

%The coefficients of the atoms in the crystal representation
u=3;
v=4;
w=-3;

%The t vector components in the crystal vector representation
tcr=[u;v;w];

%The t vector in the Cartesian representation
tca=C*tcr