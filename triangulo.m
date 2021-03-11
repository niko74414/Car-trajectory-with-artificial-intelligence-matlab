function [TG, T, plotRe] = triangulo(center_location,B,H,theta,rgb,d)

center1 = center_location(1);
center2 = center_location(2);

R = ([cos(theta) -sin(theta);sin(theta) cos(theta)]);
X1 = ([-H/3 -H/3 H/3]);
Y1 = ([B/2 -B/2 0]);

POSR = [X1;Y1];
T(:,1) = R*POSR(:,1);
T(:,2) = R*POSR(:,2);
T(:,3) = R*POSR(:,3);

TG = T;
T = [T(1,:)+center1*ones(1,3);T(2,:)+center2*ones(1,3)];

if d==1
    plotRe = fill(T(1,:), T(2,:),rgb);
end

end