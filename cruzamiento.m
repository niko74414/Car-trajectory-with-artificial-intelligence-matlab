function YY=cruzamiento(X,n)
[x1 y1]=size (X);
Y= zeros (x1,n);

for z=1:n
    B= X(:,randi(y1));
    r1= 1+randi([2 x1-1]);
    C=B(2:r1,1);
    B(2:r1,:)=[];
%     B(size(B,1),:)=[];
    [x3 y3]=size (B);
    B(x3+1:x1,1)=C;
    if B(x1,1) ~= x1
       var=B(x1,1);
       [x2 y2]=find(B(:,1)==x1);
       B(x1,1)=x1;
       B(x2,1)=var;
    end
    Y(:,z)=B;
end
YY=Y;
