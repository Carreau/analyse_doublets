function plotvez(c1,c2)
   % c1 and c2 shoudl be dictionary that contain x,y of center and radius
   % of each vesicules.
   % eg:
   % c1 = {}
   % c1.x = -5
   % c1.y = 48
   % c1.r = 21
   % 
   % c2 = {}
   % c2.x = 24
   % c2.y = 38
   % c2.r = 30
   % plotvez(c1,c2)
   
    clf
    hold on 
    g1 = acgamma(c1,c2);
    g2 = acgamma(c2,c1);
    g0 = angle(c2.x-c1.x + i*(c2.y-c1.y));
    
    circle(c1.x,c1.y,c1.r,g0+g1,2*pi+g0-g1);
    circle(c2.x,c2.y,c2.r,pi+g0+g2,3*pi+g0-g2);
    hold off
    axis equal
end

function circle(x,y,r,theta0,theta1)
    %x and y are the coordinates of the center of the circle
    %r is the radius of the circle
    %0.01 is the angle step, bigger values will draw the circle faster but
    %you might notice imperfections (not very smooth)
    ang=theta0:0.01:theta1; 
    xp=r*cos(ang);
    yp=r*sin(ang);
    plot(x+xp,y+yp);
    
end

function gamma = acgamma(c1,c2)
    a = sqrt((c1.x-c2.x)^2+(c1.y-c2.y)^2);
    b = c1.r;
    c = c2.r;
    gamma = acos((a^2+b^2-c^2)/(2*a*b));
end