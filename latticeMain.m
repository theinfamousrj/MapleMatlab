clear;
clc;

% Variables:
% 'length' is the length of the polygon (y)
% 'width' is the width of the polygon  (x)
% 'height' is the height of the polygon (z)
% 'angles' are the angles inside the polygon - format: [x y z]
% 'type' is the type of lattice structure - see chart below

% Types:
% 0 = Primitive
% 1 = Face-Centered
% 2 = Body-Centered
% 3 = Base-Centered

% Main function example:
% lattice(length, width, height, angles, type);

% Different bravais lattices:

% Orthorhombic:
% lattice(1,4,9,[90 90 90],0) % Primitive orthorhombic
% lattice(1,4,9,[90 90 90],1) % Face-centered orthorhombic
% lattice(1,4,9,[90 90 90],2) % Body-centered orthorhombic
% lattice(1,4,9,[90 90 90],3) % Base-centered orthorhombic

% Cubic:
% lattice(1,1,1,[90 90 90],0) % Primitive cubic
% lattice(1,1,1,[90 90 90],1) % Face-centered cubic
% lattice(1,1,1,[90 90 90],2) % Body-centered cubic

% Monoclinic:
% lattice(1,1,1,[60 90 90],0) % Primitive monoclinic
% lattice(1,1,1,[60 90 90],3) % Base-centered monoclinic

% Tetragonal:
% lattice(1,1,9,[90 90 90],0) % Primitive tetragonal
% lattice(1,1,9,[90 90 90],2) % Base-centered tetragonal

% TO DO: FIX THE Z-ANGLE FOR THE THREE BELOW!

% Hexagonal:
% lattice(1,1,9,[90 90 120],0) % Primitive hexagonal

% Triclinic:
% lattice(2,4,6,[60 70 80],0) % Primitive triclinic

% Trigonal:
% lattice(1,1,1,[60 60 60],0) % Primitive trigonal
