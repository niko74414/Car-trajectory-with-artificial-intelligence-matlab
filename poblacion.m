function YY = poblacion(n,Data)


[x0 y0]=size (Data);
A=zeros(x0, n);
for j= 1:n
    B=Data(2:size(Data,1)-1,:);
    for i = 2:x0-1
        [x1 y1]=size (B);
        r= randi(x1);
%         r=randi([2 size(Data,1)-1]);
        A(i,j)= B(r,1);
        B(r,:)= [ ];
    end
end
A = [ones(1,n); A(2:x0-1,:);x0*ones(1,n)];
YY=A;
