function cara = caracterhoperfield(im2)
for i=1:20
        for j=1:20
            if im2(i,j) == 0
                im2(i,j) = -1;
            else
                im2(i,j)=1;
            end
        end
end
NN=400;
w = load('valorwtotal.mat');
conta=1;
salidas = zeros(NN,1);
salidas2 = zeros(NN,1);
PIn = ([im2(:,1);im2(:,2);im2(:,3);im2(:,4);im2(:,5);im2(:,6);im2(:,7);im2(:,8);im2(:,9);im2(:,10)...
   ;im2(:,11);im2(:,12);im2(:,13);im2(:,14);im2(:,15);im2(:,16);im2(:,17);im2(:,18);im2(:,19);im2(:,20)]');
while 1
    if conta==1
        salidas=PIn*w.w;
    else
        salidas =salidas*w.w;
    end
    
    for i=1:NN
        if salidas(1,i) < 0
            salidas(1,i)= -1;
        end
        if salidas(1,i) == 0
            salidas(1,i)= salidas(1,i);
        end
        if salidas(1,i) > 0
            salidas(1,i)=1;
        end
    end
    im=reshape(salidas,20,20);
    nim = size(im);
    for i=1:nim(1)
        for j=1:nim(2)
            if im(i,j) == -1
                im(i,j) = 0;
            end
        end
    end
    if salidas2==salidas
        break;
    end
    salidas2=salidas;
    conta=conta+1
end
im
cara='';
if im(13:20,8:13)==0
    cara='a';
end
if im(5:16,1:7)==0
    cara='1';
end
if im(5:16,8:20)==0
    cara='c';
end
if (im(5,10)==0) && (im(10,18)==1) &&(im(20,10)==1)
    cara='o';
end
end