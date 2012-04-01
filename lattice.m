function lattice(length,width,height,angles,type)
% The lattice function generates a three-dimensional lattice of a given type,
% starting from [0 0 0] with specified dimensions and angles.
%
% INPUTS:   length      - the length to give the cube. 
%           width       - the width to give the cube.
%           height      - the height to give the cube.
%           angles      - the angles the cube is offset by.
%           type        - the type of cube (primitive, face-centered,
%                                               body-centered, side-centered).
%
% EXAMPLE:  lattice(2,2,2,[90 90 90],0) creates a primitive cube with a
% length of 2 on each side and a volume of 8.

% graphical features of the lattice
lineWidth = 4;              % the width of the lattice lines
markerSize = lineWidth*14;  % the size of the atom markers

% starting point of the lattice
x = 0;
y = 0;
z = 0;

% angles of the lattice
xa = angles(1);
ya = angles(2);
za = angles(3);

% starting points plus respective parameters
xw = x+width;
yl = y+length;
zh = z+height;

% calculation of coordinate changes due to angles
dx = zh*(cosd(xa)/sind(xa));    % change in the x coordinates
dy = zh*(cosd(ya)/sind(ya));    % change in the y coordinates
dz = yl*(cosd(za)/sind(za));    % change in the z coordinates

% axis setup (+- 0.5 for a little room)
Xo = x-0.5;         % smallest possible x
Xf = xw+dx+0.5;     % largest possible x
Yo = y-0.5;         % smallest possible y
Yf = yl+dy+0.5;     % largest possible y
Zo = z-0.5;         % smallest possible z
Zf = zh+dz+0.5;     % largest possible z
axis([Xo Xf Yo Yf Zo Zf]);

% lattice points
p1 = [x  y  z ];
p2 = [xw y  z ];
p3 = [xw yl z ];
p4 = [x  yl z ];

p5 = [x+dx  y+dy  zh+dz];
p6 = [xw+dx y+dy  zh+dz];
p7 = [xw+dx yl+dy zh+dz];
p8 = [x+dx  yl+dy zh+dz];

% basic lattice:
% line([x1 x2],[y1 y2],[z1 z2]);

% Drawing the bottom of the lattice. 
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p4(1) p1(1)],[p4(2) p1(2)],[p4(3) p1(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);

% Drawing the top of the lattice.
line([p5(1) p6(1)],[p5(2) p6(2)],[p5(3) p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p6(1) p7(1)],[p6(2) p7(2)],[p6(3) p7(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p7(1) p8(1)],[p7(2) p8(2)],[p7(3) p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p8(1) p5(1)],[p8(2) p5(2)],[p8(3) p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);

% Drawing the corners of the lattice.
line([p1(1) p5(1)],[p1(2) p5(2)],[p1(3) p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p2(1) p6(1)],[p2(2) p6(2)],[p2(3) p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p3(1) p7(1)],[p3(2) p7(2)],[p3(3) p7(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p4(1) p8(1)],[p4(2) p8(2)],[p4(3) p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);


% Face-Centered lattice and Base-Centered lattice.
if(type == 1 || type == 3)
    
    % Contains only Face-centered points.
    if(type ~= 3)
        
        [c1, c2, c3] = lineCenter(p1,p8);
        line([p1(1) c1],[p1(2) c2],[p1(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p4(1) c1],[p4(2) c2],[p4(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p5(1) c1],[p5(2) c2],[p5(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p8(1) c1],[p8(2) c2],[p8(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    
        [c1, c2, c3] = lineCenter(p2,p7);
        line([p2(1) c1],[p2(2) c2],[p2(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p3(1) c1],[p3(2) c2],[p3(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p6(1) c1],[p6(2) c2],[p6(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p7(1) c1],[p7(2) c2],[p7(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);

        [c1, c2, c3] = lineCenter(p1,p6);
        line([p1(1) c1],[p1(2) c2],[p1(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p2(1) c1],[p2(2) c2],[p2(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p5(1) c1],[p5(2) c2],[p5(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p6(1) c1],[p6(2) c2],[p6(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);


        [c1, c2, c3] = lineCenter(p4,p7);
        line([p4(1) c1],[p4(2) c2],[p4(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p3(1) c1],[p3(2) c2],[p3(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p8(1) c1],[p8(2) c2],[p8(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
        line([p7(1) c1],[p7(2) c2],[p7(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);

    end
    
    % Base-Centered and Face-Centered points.
    [c1, c2, c3] = lineCenter(p1,p3);
    line([p1(1) c1],[p1(2) c2],[p1(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p3(1) c1],[p3(2) c2],[p3(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p2(1) c1],[p2(2) c2],[p2(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p4(1) c1],[p4(2) c2],[p4(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);


    % Base-Centered and Face-Centered points.
    [c1, c2, c3] = lineCenter(p5,p7);
    line([p5(1) c1],[p5(2) c2],[p5(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p7(1) c1],[p7(2) c2],[p7(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p6(1) c1],[p6(2) c2],[p6(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p8(1) c1],[p8(2) c2],[p8(3) c3],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);

end


% Body-Centered lattice.
if(type == 2)
    
    % The center of the area.
    pc = [ (x+xw+dx)/2 (y+yl+dy)/2 (z+zh)/2 ];
    
    % Lines from the bottom of the shape.
    line([p1(1) pc(1)],[p1(2) pc(2)],[p1(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p2(1) pc(1)],[p2(2) pc(2)],[p2(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p3(1) pc(1)],[p3(2) pc(2)],[p3(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p4(1) pc(1)],[p4(2) pc(2)],[p4(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    
    % Lines from the top of the shape.
    line([p5(1) pc(1)],[p5(2) pc(2)],[p5(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p6(1) pc(1)],[p6(2) pc(2)],[p6(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p7(1) pc(1)],[p7(2) pc(2)],[p7(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p8(1) pc(1)],[p8(2) pc(2)],[p8(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    
end


% Legend calculations

% legendString = 'Calculations:';

% legendString = strcat(legendString, '\newline recip. lattice: ');
% legendString = strcat(legendString, calcRecipLattice());
% legendString = strcat(legendString, '\newline n.n. distance: ');
% legendString = strcat(legendString, calcNearNeighbor());

% legendString = strcat(legendString, '\newline packing fraction: ');
% legendString = strcat(legendString, calcPackingFraction());
% legendString = strcat(legendString, '\newline atomic radii: ');
% legendString = strcat(legendString, calcAtomicRadii(length,width,height,type));
% legendString = strcat(legendString, '\newline unit volume: ');
% legendString = strcat(legendString, calcUnitVolume());
% 
% legend(legendString);
