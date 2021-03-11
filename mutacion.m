function Y=mutacion(X,n)
% x=población
% n=numero de cromosomas para ser cruzados 
%
[x1 y1]=size (X);
Y= zeros (x1,n);

for z=1:n
    A= X(:,randi(y1));
    r1= 1+randi(x1-1,1,2);
    while r1(1) == r1(2)
        r1=1+randi(x1-1,1,2);
    end
    B=A(r1(1),1);
    A(r1(1),1)=A(r1(2),1);
    A(r1(2),1)=B;
    if A(x1,1) ~= x1
       var=A(x1,1);
       [x2 y2]=find(A(:,1)==x1);
       A(x1,1)=x1;
       A(x2,1)=var;
    end
    Y(:,z)=A; 
end
YY=Y;
