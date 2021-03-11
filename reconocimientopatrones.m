clc
clear all
close all

imagen = imread('imagenprueba5.jpg');
imshow(imagen)

% grises = rgb2gray(img);
% 
% umbral =0.4;
% 
% BW = im2bw(grises,umbral)
if ~islogical(imagen)

    imagen=im2bw(imagen,0.36);

end
    imshow(imagen)
    
a=~imagen;
a = medfilt2(a,[3 3]);
a = bwareaopen(a,50);

imshow(a)
[bw,num] = bwlabel(a,8);
stats = regionprops(bw,'BoundingBox','Centroid');

binaryImage = imfill(a, 'holes');
cont=1;
for k=1: length(stats)
    [f c]=find(bw==k);

    lmaxc=max(c);
    lminc=min(c);
    lmaxf=max(f);
    lminf=min(f);
    errorfil=lmaxf-lminf
    errorcol=lmaxc-lminc
    if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
        imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
    %imagen=a(caja(1):caja(2),caja(3):caja(4))
        if(cont==1)
          J = imresize(imagn, [10 10]);
        else
          J(:,:,cont) = imresize(imagn, [10 10]);
        end
        cont=cont+1
        caja=stats(k).BoundingBox;
        rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
        'EdgeColor','r','LineWidth',3)
    end
end

% for object = 1:length(stats)
%     bb=stats(object).BoundingBox;
%     bc=stats(object).Centroid;
%     rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
%     plot(bc(1),bc(2),'-m+')
%     a=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
%     set(a,'FontName', 'Arial','FontWeight','bold','FontSize',12,'Color','yellow');
% end
% hold on
% 
% 
% % stats1 = regionprops(bw1,'BoundingBox','Centroid');
% % stats2 = regionprops(bw2,'BoundingBox','Centroid');
% 
% % [f c]=find(a);
% % 
% % lmaxc=max(c);lminc=min(c);
% % 
% % lmaxf=max(f);lminf=min(f);
% % 
% % imgn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
% % 
% % imshow(imgn)
% % diff_im = imsubtract(imag(:,:,1),rgb2gray(imag));
% % diff_im1 = imsubtract(imag(:,:,2),rgb2gray(imag));
% % diff_im2 = imsubtract(imag(:,:,3),rgb2gray(imag));
% % 
% % imshow(diff_im)
% % 
% % diff_im = medfilt2(diff_im,[3 3]);
% % diff_im1 = medfilt2(diff_im1,[3 3]);
% % diff_im2 = medfilt2(diff_im2,[3 3]);
% % imshow(diff_im)
% % 
% % diff_im = im2bw(diff_im,0.18);
% % diff_im1 = im2bw(diff_im1,0.03);
% % diff_im2 = im2bw(diff_im2,0.07);
% % imshow(diff_im)
% % 
% % diff_im = bwareaopen(diff_im,300);
% % diff_im1 = bwareaopen(diff_im1,300);
% % diff_im2 = bwareaopen(diff_im2,300);
% % imshow(diff_im)
% % 
% % bw = bwlabel(diff_im,8);
% % bw1 = bwlabel(diff_im1,8);
% % bw2 = bwlabel(diff_im2,8);
% % 
% % stats = regionprops(bw,'BoundingBox','Centroid');
% % stats1 = regionprops(bw1,'BoundingBox','Centroid');
% % stats2 = regionprops(bw2,'BoundingBox','Centroid');
% 
% umbral= graythresh(imagen);
% imag_bw=im2bw(imagen,umbral);
% imshow(imag_bw)
% 
% imag_bw_label=bwlabel(imag_bw);
% figure
% imshow(label2rgb(imag_bw_label));
% propiedades = regionprops(imag_bw_label)
% 
% for k=1: length(propiedades)
%     caja=propiedades(k).BoundingBox;
%     rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
%         'EdgeColor','r','LineWidth',3)
% end
