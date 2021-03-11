function [YY1 YY2]=seleccion(P1,B,p)

[r1 c1]=find (B==max(B));
Y1(:,1)=P1(:,max(c1));
Fn(1,1)=1/B(1,max(c1));
C=sum(B);
D=B/C;
E=cumsum(D);
N=rand(1);   
d1=1;
d2=1;
while d2<=p-1
    if N<= E(d1)
        Y1(:,d2+1)=P1(:,d1);
        Fn(1,d2+1)=1/B(1,d1);
        N=rand(1);
        d2=d2+1;
        d1=1;
    else
        d1=d1+1;
    end
end
YY1=Y1;
YY2=Fn;
