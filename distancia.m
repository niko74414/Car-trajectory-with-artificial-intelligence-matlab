function YY=distancia(P,Data)
[x0 y0]=size(P);
i=1;
for i=1:y0
    A=P(:,i); 
    B=zeros(size(A));
    for j1=1:x0-1
        [x1 y1]=find(Data(:,1)==A(j1,1));
        [x2 y2]=find(Data(:,1)==A(j1+1,1));
        B(j1,1)=sqrt((Data(x1,2)- Data(x2,2))^2+(Data(x1,3)- Data(x2,3))^2);
    end
    [x1 y1]=find(Data(:,1)==A(1,1));
    [x2 y2]=find(Data(:,1)==A(x0,1));
    B(j1+1,1)=sqrt((Data(x1,2)- Data(x2,2))^2+(Data(x1,3)- Data(x2,3))^2);
    Y(1,i)=1/sum(B);
end
YY=Y;
