function cubicLattice(startPoint,length,width,height,angles,type)
% The cubicLattice function generates a three-dimensional cube of a given type,
% starting from startPoint with dimensions length, width, and height.
%
% INPUTS:   startPoint  - the point to start from. [x y z]
%           length      - the length to give the cube. 
%           width       - the width to give the cube.
%           height      - the height to give the cube.
%           angles      - the angles the cube is offset by.
%           type        - the type of cube (pcc, fcc, bcc).
%
% Example:
% lattice([0 0 0],1,1,1,1)

% graphical features of the lattice
lineWidth = 4;              % the width of the lattice lines
markerSize = lineWidth*12;  % the size of the atom markers

% starting point of the lattice
x = startPoint(1);
y = startPoint(2);
z = startPoint(3);

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

% axis setup (+- 0.5 for a little room)
Xo = x-0.5;         % smallest possible x
Xf = xw+dx+0.5;     % largest possible x
Yo = y-0.5;         % smallest possible y
Yf = yl+dy+0.5;     % largest possible y
Zo = z-0.5;         % smallest possible z
Zf = zh+0.5;        % largest possible z
axis([Xo Xf Yo Yf Zo Zf]);

% lattice points
p1 = [x  y  z ];
p2 = [xw y  z ];
p3 = [xw yl z ];
p4 = [x  yl z ];

p5 = [x+dx  y+dy  zh];
p6 = [xw+dx y+dy  zh];
p7 = [xw+dx yl+dy zh];
p8 = [x+dx  yl+dy zh];

pc = [ (x+xw+dx)/2 
       (y+yl+dy)/2 
       (z+zh)/2 ];

% basic lattice:
% line([x1 x2],[y1 y2],[z1 z2]);

% bottom 
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p4(1) p1(1)],[p4(2) p1(2)],[p4(3) p1(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);

% top
line([p5(1) p6(1)],[p5(2) p6(2)],[p5(3) p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p6(1) p7(1)],[p6(2) p7(2)],[p6(3) p7(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p7(1) p8(1)],[p7(2) p8(2)],[p7(3) p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p8(1) p5(1)],[p8(2) p5(2)],[p8(3) p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);

% corners
line([p1(1) p5(1)],[p1(2) p5(2)],[p1(3) p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p2(1) p6(1)],[p2(2) p6(2)],[p2(3) p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p3(1) p7(1)],[p3(2) p7(2)],[p3(3) p7(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);
line([p4(1) p8(1)],[p4(2) p8(2)],[p4(3) p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','k','LineWidth',lineWidth);

% fcc
if(type == 1) % p4 to p5 are problem areas!
%     line([p1(1) 0.5*p8(1)],[p1(2) 0.5*p8(2)],[p1(3) 0.5*p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p4(1) 0.5*p5(1)],[p4(2) 0.5*p4(2)],[p4(3) 0.5*p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p5(1) 0.5*p5(1)],[p5(2) 0.5*p4(2)],[p5(3) 0.5*p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p8(1) 0.5*p8(1)],[p8(2) 0.5*p8(2)],[p8(3) 0.5*p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
% 
%     line([p2(1) 0.5*p7(1)],[p2(2) 0.5*p7(2)],[p2(3) 0.5*p7(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p3(1) 0.5*p6(1)],[p3(2) 0.5*p3(2)],[p3(3) 0.5*p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p6(1) 0.5*p3(1)],[p6(2) 0.5*p3(2)],[p6(3) 0.5*p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p7(1) 0.5*p2(1)],[p7(2) 0.5*p2(2)],[p7(3) 0.5*p2(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
% 
%     line([p1(1) 0.5*p6(1)],[p1(2) 0.5*p6(2)],[p1(3) 0.5*p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p2(1) 0.5*p2(1)],[p2(2) 0.5*p5(2)],[p2(3) 0.5*p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p5(1) 0.5*p2(1)],[p5(2) 0.5*p2(2)],[p5(3) 0.5*p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p6(1) 0.5*p6(1)],[p6(2) 0.5*p1(2)],[p6(3) 0.5*p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
% 
%     line([p4(1) 0.5*p7(1)],[p4(2) 0.5*p7(2)],[p4(3) 0.5*p7(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p3(1) 0.5*p3(1)],[p3(2) 0.5*p8(2)],[p3(3) 0.5*p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p8(1) 0.5*p3(1)],[p8(2) 0.5*p3(2)],[p8(3) 0.5*p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p7(1) 0.5*p7(1)],[p7(2) 0.5*p4(2)],[p7(3) 0.5*p7(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
% 
%     line([p1(1) 0.5*p3(1)],[p1(2) 0.5*p3(2)],[p1(3) 0.5*p3(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p3(1) 0.5*p3(1)],[p3(2) 0.5*p3(2)],[p3(3) 0.5*p1(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p2(1) 0.5*p2(1)],[p2(2) 0.5*p4(2)],[p2(3) 0.5*p4(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p4(1) 0.5*p2(1)],[p4(2) 0.5*p4(2)],[p4(3) 0.5*p2(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
% 
%     line([p5(1) 0.5*p7(1)],[p5(2) 0.5*p7(2)],[p5(3) 0.5*p7(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p3(1) 0.5*p7(1)],[p7(2) 0.5*p7(2)],[p7(3) 0.5*p5(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p6(1) 0.5*p6(1)],[p6(2) 0.5*p8(2)],[p6(3) 0.5*p8(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
%     line([p8(1) 0.5*p6(1)],[p8(2) 0.5*p8(2)],[p8(3) 0.5*p6(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
end

% bcc
if(type == 2)
    
    line([p1(1) pc(1)],[p1(2) pc(2)],[p1(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p2(1) pc(1)],[p2(2) pc(2)],[p2(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p3(1) pc(1)],[p3(2) pc(2)],[p3(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p4(1) pc(1)],[p4(2) pc(2)],[p4(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    
    line([p5(1) pc(1)],[p5(2) pc(2)],[p5(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p6(1) pc(1)],[p6(2) pc(2)],[p6(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p7(1) pc(1)],[p7(2) pc(2)],[p7(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    line([p8(1) pc(1)],[p8(2) pc(2)],[p8(3) pc(3)],'Marker','.','MarkerSize',markerSize,'LineStyle','-','Color','g','LineWidth',lineWidth);
    
end

theString = 'Calculations:';
theString = strcat(theString, '\newline atomic radii: ');
theString = strcat(theString, '\newline other stuff:');
theString = strcat(theString, '\newline yadda yadda:');
theString = strcat(theString, '\newline blahh blaah:');

legend(theString);
