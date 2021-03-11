function varargout = Reconocerpatron(varargin)
% RECONOCERPATRON MATLAB code for Reconocerpatron.fig
%      RECONOCERPATRON, by itself, creates a new RECONOCERPATRON or raises the existing
%      singleton*.
%
%      H = RECONOCERPATRON returns the handle to a new RECONOCERPATRON or the handle to
%      the existing singleton*.
%
%      RECONOCERPATRON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONOCERPATRON.M with the given input arguments.
%
%      RECONOCERPATRON('Property','Value',...) creates a new RECONOCERPATRON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reconocerpatron_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reconocerpatron_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reconocerpatron
% Last Modified by GUIDE v2.5 01-Jun-2020 09:25:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reconocerpatron_OpeningFcn, ...
                   'gui_OutputFcn',  @Reconocerpatron_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Reconocerpatron is made visible.
function Reconocerpatron_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reconocerpatron (see VARARGIN)

% Choose default command line output for Reconocerpatron

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Reconocerpatron wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reconocerpatron_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function min_i = distanciaminima(posicion)

global ring
ij = length(ring);
distV = zeros(ij(1),1);
for i=1:ij
    wij = ring(i,:);
    distV(i) = norm(posicion-wij);
end
min_i = -1;
minDist = min(distV);
min_i = find(distV==minDist);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a stats bw imagen
[nombre dire]=uigetfile('*.jpg','Abrir');
if nombre == 0
    return
end
imagen=imread(fullfile(dire,nombre));
axes(handles.axes1)
image(imagen)

if ~islogical(imagen)
    imagen=im2bw(imagen,0.38);
end 
a=~imagen;
a = medfilt2(a,[3 3]);
a = bwareaopen(a,50);
[bw,num] = bwlabel(a,8);
stats = regionprops(bw,'BoundingBox','Centroid');
cont=1;
for k=1: length(stats)
    [f c]=find(bw==k);
    lmaxc=max(c);
    lminc=min(c);
    lmaxf=max(f);
    lminf=min(f);
    errorfil=lmaxf-lminf;
    errorcol=lmaxc-lminc;
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
        bc=stats(k).Centroid;
%         rectangle('Position',caja,'EdgeColor','r','LineWidth',2)
%         plot(bc(1),bc(2),'-m+')
%         pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
%         set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
        hold on
    end
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a stats bw imagen
axes(handles.axes2);
hold off
cont=1;
imshow(imagen)
contador=1;
if get(handles.radiobutton3,'Value')
    for k=1: length(stats)
        [f c]=find(bw==k);
        
        lmaxc=max(c);
        lminc=min(c);
        lmaxf=max(f);
        lminf=min(f);
        errorfil=lmaxf-lminf;
        errorcol=lmaxc-lminc;
        if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
            imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
            %imagen=a(caja(1):caja(2),caja(3):caja(4))
            if(cont==1)
                J = imresize(imagn, [10 10]);
            else
                J(:,:,cont) = imresize(imagn, [10 10]);
            end
            cara = calculoRed10x10(J(:,:,cont));
            if(cara =="1")
                cont=cont+1;
                axes(handles.axes2);
                caja=stats(k).BoundingBox;
                rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
                    'EdgeColor','r','LineWidth',3)
                bc=stats(k).Centroid;
                %       rectangle('Position',caja,'EdgeColor','r','LineWidth',2)
                %       plot(bc(1),bc(2),'-m+')
                pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
                if contador==1
                    m=[(round(bc(1))) (round(bc(2)))]
                else
                    m=[m;(round(bc(1))) (round(bc(2)))]
                end
                set(handles.uitable1,'data',m);
                contador=2;
                set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
                hold on
            end
        end
    end
else
    for k=1: length(stats)
        [f c]=find(bw==k);
        
        lmaxc=max(c);
        lminc=min(c);
        lmaxf=max(f);
        lminf=min(f);
        errorfil=lmaxf-lminf;
        errorcol=lmaxc-lminc;
        if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
            imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
            if(cont==1)
                J = imresize(imagn, [20 20]);
            else
                J(:,:,cont) = imresize(imagn, [20 20]);
            end
            PIn=J(:,:,cont)
            cara = caracterhoperfield(double(PIn))
            if(cara =="1")
                cont=cont+1;
                axes(handles.axes2);
                caja=stats(k).BoundingBox;
                rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
                    'EdgeColor','r','LineWidth',3)
                bc=stats(k).Centroid;
                pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
                if contador==1
                    m=[(round(bc(1))) (round(bc(2)))]
                else
                    m=[m;(round(bc(1))) (round(bc(2)))]
                end
                set(handles.uitable1,'data',m);
                contador=2;
                set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
                hold on
            end
        end
    end
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a stats bw imagen
axes(handles.axes2);
hold off
cont=1;
imshow(imagen)
contador=1;
if get(handles.radiobutton3,'Value')
    for k=1: length(stats)
        [f c]=find(bw==k);
        
        lmaxc=max(c);
        lminc=min(c);
        lmaxf=max(f);
        lminf=min(f);
        errorfil=lmaxf-lminf;
        errorcol=lmaxc-lminc;
        if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
            imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
            %imagen=a(caja(1):caja(2),caja(3):caja(4))
            if(cont==1)
                J = imresize(imagn, [10 10]);
            else
                J(:,:,cont) = imresize(imagn, [10 10]);
            end
            cara = calculoRed10x10(J(:,:,cont))
            if(cara =="A")
                cont=cont+1
                axes(handles.axes2);
                caja=stats(k).BoundingBox;
                rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
                    'EdgeColor','r','LineWidth',3)
                bc=stats(k).Centroid;
                %         rectangle('Position',caja,'EdgeColor','r','LineWidth',2)
                %         plot(bc(1),bc(2),'-m+')
                pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
                if contador==1
                    m=[(round(bc(1))) (round(bc(2)))]
                else
                    m=[m;(round(bc(1))) (round(bc(2)))]
                end
                set(handles.uitable1,'data',m);
                contador=2;
                set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
                hold on
            end
        end
    end
else
    for k=1: length(stats)
        [f c]=find(bw==k);
        lmaxc=max(c);
        lminc=min(c);
        lmaxf=max(f);
        lminf=min(f);
        errorfil=lmaxf-lminf;
        errorcol=lmaxc-lminc;
        if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
            imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
            if(cont==1)
                J = imresize(imagn, [20 20]);
            else
                J(:,:,cont) = imresize(imagn, [20 20]);
            end
            PIn=J(:,:,cont)
            cara = caracterhoperfield(double(PIn))
            if(cara =="a")
                cont=cont+1;
                axes(handles.axes2);
                caja=stats(k).BoundingBox;
                rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
                    'EdgeColor','r','LineWidth',3)
                bc=stats(k).Centroid;
                pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
                if contador==1
                    m=[(round(bc(1))) (round(bc(2)))]
                else
                    m=[m;(round(bc(1))) (round(bc(2)))]
                end
                set(handles.uitable1,'data',m);
                contador=2;
                set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
                hold on
            end
        end
    end
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a stats bw imagen
axes(handles.axes2);
hold off
cont=1;
imshow(imagen)
contador =1;
if get(handles.radiobutton3,'Value')
    for k=1: length(stats)
        [f c]=find(bw==k);
        
        lmaxc=max(c);
        lminc=min(c);
        lmaxf=max(f);
        lminf=min(f);
        errorfil=lmaxf-lminf;
        errorcol=lmaxc-lminc;
        if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
            imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
            %imagen=a(caja(1):caja(2),caja(3):caja(4))
            if(cont==1)
                J = imresize(imagn, [10 10]);
            else
                J(:,:,cont) = imresize(imagn, [10 10]);
            end
            cara = calculoRed10x10(J(:,:,cont))
            if(cara =="C")
                cont=cont+1
                axes(handles.axes2);
                caja=stats(k).BoundingBox;
                rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
                    'EdgeColor','r','LineWidth',3)
                bc=stats(k).Centroid;
                %         rectangle('Position',caja,'EdgeColor','r','LineWidth',2)
                %         plot(bc(1),bc(2),'-m+')
                pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
                if contador==1
                    m=[(round(bc(1))) (round(bc(2)))]
                else
                    m=[m;(round(bc(1))) (round(bc(2)))]
                end
                set(handles.uitable1,'data',m);
                contador=2;
                set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
                hold on
            end
        end
    end
else
    for k=1: length(stats)
        [f c]=find(bw==k);
        lmaxc=max(c);
        lminc=min(c);
        lmaxf=max(f);
        lminf=min(f);
        errorfil=lmaxf-lminf;
        errorcol=lmaxc-lminc;
        if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
            imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
            if(cont==1)
                J = imresize(imagn, [20 20]);
            else
                J(:,:,cont) = imresize(imagn, [20 20]);
            end
            PIn=J(:,:,cont)
            cara = caracterhoperfield(double(PIn))
            if(cara =="c")
                cont=cont+1;
                axes(handles.axes2);
                caja=stats(k).BoundingBox;
                rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
                    'EdgeColor','r','LineWidth',3)
                bc=stats(k).Centroid;
                pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
                if contador==1
                    m=[(round(bc(1))) (round(bc(2)))]
                else
                    m=[m;(round(bc(1))) (round(bc(2)))]
                end
                set(handles.uitable1,'data',m);
                contador=2;
                set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
                hold on
            end
        end
    end
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a stats bw imagen ab 
axes(handles.axes2);
hold off
cont=1;
imshow(imagen)
contador=1;
cont=1;
ab=0;
rectangulo=0;
if get(handles.radiobutton3,'Value')
    for k=1: length(stats)
        [f c]=find(bw==k);
        
        lmaxc=max(c);
        lminc=min(c);
        lmaxf=max(f);
        lminf=min(f);
        errorfil=lmaxf-lminf;
        errorcol=lmaxc-lminc;
        if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
            imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
            %imagen=a(caja(1):caja(2),caja(3):caja(4))
            if(cont==1)
                J = imresize(imagn, [10 10]);
            else
                J(:,:,cont) = imresize(imagn, [10 10]);
            end
            cara = calculoRed10x10(J(:,:,cont))
            if(cara =="O")
                cont=cont+1
                axes(handles.axes2);
                caja=stats(k).BoundingBox;
                rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
                    'EdgeColor','r','LineWidth',3)
                bc=stats(k).Centroid;
                %         rectangle('Position',caja,'EdgeColor','r','LineWidth',2)
                %         plot(bc(1),bc(2),'-m+')
                pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
                %         ab(cont,:)=[ num2str(round(bc(1))) num2str(round(bc(2)))];
                
                if contador==1
                    m=[(round(bc(1))) (round(bc(2)))]
                else
                    m=[m;(round(bc(1))) (round(bc(2)))]
                end
                set(handles.uitable1,'data',m);
                contador=2;
                set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
                hold on
            end
        end
    end
else
    for k=1: length(stats)
        [f c]=find(bw==k);
        lmaxc=max(c);
        lminc=min(c);
        lmaxf=max(f);
        lminf=min(f);
        errorfil=lmaxf-lminf;
        errorcol=lmaxc-lminc;
        if(abs(errorfil-errorcol)<20&& errorfil>100 &&errorcol>100)
            imagn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
            if(cont==1)
                J = imresize(imagn, [20 20]);
            else
                J(:,:,cont) = imresize(imagn, [20 20]);
            end
            PIn=J(:,:,cont)
            cara = caracterhoperfield(double(PIn))
            if(cara =="o")
                cont=cont+1;
                axes(handles.axes2);
                caja=stats(k).BoundingBox;
                rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
                    'EdgeColor','r','LineWidth',3)
                bc=stats(k).Centroid;
                pala=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),'  Y: ',num2str(round(bc(2)))));
                if contador==1
                    m=[(round(bc(1))) (round(bc(2)))]
                else
                    m=[m;(round(bc(1))) (round(bc(2)))]
                end
                set(handles.uitable1,'data',m);
                contador=2;
                set(pala,'FontName', 'Arial','FontWeight','bold','FontSize',8,'Color','black');
                hold on
            end
        end
    end
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen ring
ab=single(get(handles.uitable1,'data'))
xini=str2double(get(handles.edit1,'String'));
yini=str2double(get(handles.edit2,'String'));
xfini=str2double(get(handles.edit3,'String'));
yfini=str2double(get(handles.edit4,'String'));
ab=[xini yini;ab;xfini yfini];
if get(handles.radiobutton5,'Value')
    U0=0.1;
    T2=10000;
    
    [row, column]=size(ab);
    maxpuntos=row;
    axes(handles.axes2);
    datosab=ab;
    
    neuronasporpunto=2;
    neuronamaxima=maxpuntos*neuronasporpunto;
    ring=zeros(neuronamaxima,2);
    [rowring,colring]=size(ring);
    ring =[4500*rand(neuronamaxima-2,1) 4500*rand(neuronamaxima-2,1)];
    ring = sortrows(ring,1);
    ring = [datosab(1,:);ring;datosab(maxpuntos,:)];
    iteracionactual=0;
    contador=1;
    pp = 0;
    puntoactual=1;
    axes(handles.axes2);
    k = 1;
    it = 1;
    pp = 0;
    contador=1;
    contador1=1;
    neuronagana=1;
    sigma=neuronamaxima
    while 1
        contador=1;
        mij = distanciaminima(datosab(k,:));
        for i=2:length(ring)-1
            h = exp(-(((mij-i)^2)/(2*sigma^2)));
            t1 = 1000/log10(neuronamaxima);
            sigma = neuronamaxima*exp(-(it/t1));
            ring(i,:) = ring(i,:) + (U0*exp(-it/T2))*h*(datosab(k,:)-ring(i,:));
        end
        pp=pp+1;
        if pp==100
            axes(handles.axes2);
            po = scatter(datosab(:,1),datosab(:,2));
            hold on;
            imshow(imagen)
            plot(ring(:,1),ring(:,2),'o-','MarkerEdgeColor','red');
            drawnow;
            hold off;
            pp=0
        end
        k = k + 1;
        it = it + 1;
        if k == maxpuntos
            k = 1;
        end
        if get(handles.radiobutton1,'Value')
            break;
        end
    end
    
    longitudring=0;
    for i=1:neuronamaxima-1
        longitudring=longitudring+ sqrt((ring(i,1)-ring(i+1,1))^2+(ring(i,2)-ring(i+1,2))^2);
    end
    longitudring=longitudring+ sqrt((ring(neuronamaxima,1)-ring(1,1))^2+(ring(neuronamaxima,2)-ring(1,2))^2)
    set(handles.edit5,'String',num2str(longitudring));
else
    p = str2double(get(handles.edit9,'String'));
    elit = (str2double(get(handles.edit6,'String'))/100)*p;
    m = (str2double(get(handles.edit8,'String'))/100)*p;
    torneo = (str2double(get(handles.edit7,'String'))/100)*p;
    
    Data = [[1:size(ab,1)]' ab];

    c=torneo+elit;
    P=poblacion(p,Data);
    conta=1;
    i=1;
    ring =zeros(size(Data));
    while 1
        m = (str2double(get(handles.edit8,'String'))/100)*p;
        P(:,p+1:p+c)=cruzamiento(P,c);
        P(:,p+c+1:p+c+m)=mutacion(P,m);
        E=distancia(P,Data);
        [P S]=seleccion(P,E,p);
        Mejor=S(1,1);
        conta=conta+1;
        ring =zeros(size(Data));
        for n=1:size(Data,1)
            ring(n,:)=Data(P(n,1),:);
        end
            ring=ring(:,2:3);
            axes(handles.axes2);
            po = scatter(ring(:,1),ring(:,2));
            hold on;
            imshow(imagen)
            plot(ring(:,1),ring(:,2),'o-','MarkerEdgeColor','red');
            drawnow;
            hold off;
        
        if get(handles.radiobutton1,'Value')
            break;
        end
        i=i+1;
    end
    set(handles.edit5,'String',num2str(Mejor));
end



% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ring imagen
ab=double(get(handles.uitable1,'data'))
x(1)=0;
y(1)=0;
phi(1)=pi()/2;

pxd(1)=ring(2,1)
pyd(1)=ring(2,2)
phid(1) = atan2(ring(3,1),ring(3,2))

% pxd(1)=1000
% pyd(1)=1000
% phid(1) = atan2(pyd(1),pxd(1));

K1=0.5;
K2=0.5;
q2=0.5;

tfin=300;
T0=0.1;
t=[0:T0:tfin];

i=1;
X=[ pxd(1)/1000];
Y=[ pyd(1)/1000];
% box1X=[ ab(1,1)/1000]
% box1Y=[ ab(1,2)/1000]
% box2X=[ ab(2,1)/1000]
% box2Y=[ ab(2,2)/1000]
% box3X=[ ab(3,1)/1000]
% box3Y=[ ab(3,2)/1000]
% box4X=[ ab(4,1)/1000]
% box4Y=[ ab(4,2)/1000]
% box5X=[ ab(5,1)/1000]
% box5Y=[ ab(5,2)/1000]
% box6X=[ ab(6,1)/1000]
% box6Y=[ ab(6,2)/1000]
varbox=1;
for nn=1:length(ring)-1
    if ismembertol((ring(nn)),ab(:,:))
       box(varbox,:)=double(ring(nn,:))
       varbox=varbox+1;
    end
end
box1X=[box(1,1)/1000]
box1Y=[box(1,2)/1000]
box2X=[box(2,1)/1000]
box2Y=[box(2,2)/1000]
box3X=[box(3,1)/1000]
box3Y=[box(3,2)/1000]
box4X=[box(4,1)/1000]
box4Y=[box(4,2)/1000]
box5X=[box(5,1)/1000]
box5Y=[box(5,2)/1000]
box6X=[box(6,1)/1000]
box6Y=[box(6,2)/1000]
l(1)=0;
lo=l;
angulo1=80;
angulo2=45;
angulo1tot=angulo1;
angulo2tot=angulo2;
conta=0;
contabox=0;
for k=1:length(t)
    iota(k)=sqrt((pxd(i)-x(k))^2+(pyd(i)-y(k))^2);
    dseta(k)=atan2((pyd(i)-y(k)),(pxd(i)-x(k)))-phi(k);
    psi(k)=atan2((pyd(i)-y(k)),(pxd(i)-x(k)))-phid(i);
    %     if (iota(k)<5 && iota(k)>-5 && psi(k)<3 && psi(k)>-3)
    if (iota(k)<200 && iota(k)>-200 && i<length(ring)-1) && l(k)==0
        if ismembertol((pxd(i)),ab(:,:)) && conta==0
            contabox=contabox+1;
            l(k)=1
            deltk=k;
        else
            l(k)=0;
            conta=0;
            i=i+1;
            pxd(i)=ring(i+1,1);
            pyd(i)=ring(i+1,2);
            phid(i) = atan2(ring(i+1,1),ring(i+1,2));
        end
    end
    if l(k)==1
        uref(k) =0;
        wref(k) =0;
        l(k+1)=1;
        kdelta=k-deltk;
        if(kdelta<20)
           angulo2(k+1)=angulo2(k)-2;
           angulo1(k+1)=angulo1(k);
        end
        if(kdelta<40 && kdelta>=20)
           angulo2(k+1)=angulo2(k)+2;
           angulo1(k+1)=angulo1(k);
        end
        if(kdelta<110 && kdelta>=40)
           angulo1(k+1)=angulo1(k)-2;
           angulo2(k+1)=angulo2(k);
        end
        if(kdelta<180 && kdelta>=110)
           angulo1(k+1)=angulo1(k)+2;
           angulo2(k+1)=angulo2(k);
           box(contabox,:)=[0 0];
        end
        if(kdelta>=180)
           l(k+1)=0;
           conta=1;
           angulo1(k+1)=angulo1(k);
           angulo2(k+1)=angulo2(k);
        end
    else
    angulo1(k+1)=angulo1(k);
    angulo2(k+1)=angulo2(k);
    uref(k)=K1*cos(dseta(k))*iota(k);
    wref(k)=K2*dseta(k)+(K1/dseta(k))*cos(dseta(k))*sin(dseta(k))*(dseta(k)+q2*psi(k));
    l(k+1)=0;
    end
    
    xp=uref(k)*cos(phi(k));
    yp=uref(k)*sin(phi(k));
    phi(k+1)=wref(k)*T0+phi(k);
    
    
    imshow(imagen)
    hold on;
    plot(ring(:,1),ring(:,2),'o-','MarkerEdgeColor','red');
    [TG, T, plotRe] = triangulo([x(k),y(k)],100,300,phi(k),'blue',1);
    drawnow;
    hold off;
    pp=0;
    x(k+1)=xp*T0+x(k);
    y(k+1)=yp*T0+y(k);
    lo=[lo;l(k)];
    angulo1tot=[angulo1tot;angulo1(k)];
    angulo2tot=[angulo2tot;angulo2(k)];
    X=[X; pxd(i)/1000];
    Y=[Y; pyd(i)/1000];
    box1X=[box1X; box(1,1)/1000];
    box1Y=[box1Y; box(1,2)/1000];
    box2X=[box2X; box(2,1)/1000];
    box2Y=[box2Y; box(2,2)/1000];
    box3X=[box3X; box(3,1)/1000];
    box3Y=[box3Y; box(3,2)/1000];
    box4X=[box4X; box(4,1)/1000];
    box4Y=[box4Y; box(4,2)/1000];
    box5X=[box5X; box(5,1)/1000];
    box5Y=[box5Y; box(5,2)/1000];
    box6X=[box6X; box(6,1)/1000];
    box6Y=[box6Y; box(6,2)/1000];
    
    if get(handles.radiobutton2,'Value')
        break;
    end
    if i>length(ring)-1 && iota(k)<100 && iota(k)>-100
       break; 
    end
end
angulo1tot=angulo1tot.*(pi()/180);
angulo2tot=angulo2tot.*(pi()/180);
X=timetable(X,'TimeStep',seconds(0.1));
Y=timetable(Y,'TimeStep',seconds(0.1));
lo=timetable(lo,'TimeStep',seconds(0.1));
angulo1tot=timetable(angulo1tot,'TimeStep',seconds(0.1));
angulo2tot=timetable(angulo2tot,'TimeStep',seconds(0.1));
box1X=timetable(box1X,'TimeStep',seconds(0.1));
box1Y=timetable(box1Y,'TimeStep',seconds(0.1));
box2X=timetable(box2X,'TimeStep',seconds(0.1));
box2Y=timetable(box2Y,'TimeStep',seconds(0.1));
box3X=timetable(box3X,'TimeStep',seconds(0.1));
box3Y=timetable(box3Y,'TimeStep',seconds(0.1));
box4X=timetable(box4X,'TimeStep',seconds(0.1));
box4Y=timetable(box4Y,'TimeStep',seconds(0.1));
box5X=timetable(box5X,'TimeStep',seconds(0.1));
box5Y=timetable(box5Y,'TimeStep',seconds(0.1));
box6X=timetable(box6X,'TimeStep',seconds(0.1));
box6Y=timetable(box6Y,'TimeStep',seconds(0.1));
assignin('base', 'lo' ,lo)
assignin('base', 'X' ,X)
assignin('base', 'Y' ,Y)
assignin('base', 'angulo1tot' ,angulo1tot)
assignin('base', 'angulo2tot' ,angulo2tot)
assignin('base', 'box1X' ,box1X)
assignin('base', 'box1Y' ,box1Y)
assignin('base', 'box2X' ,box2X)
assignin('base', 'box2Y' ,box2Y)
assignin('base', 'box3X' ,box3X)
assignin('base', 'box3Y' ,box3Y)
assignin('base', 'box4X' ,box4X)
assignin('base', 'box4Y' ,box4Y)
assignin('base', 'box5X' ,box5X)
assignin('base', 'box5Y' ,box5Y)
assignin('base', 'box6X' ,box6X)
assignin('base', 'box6Y' ,box6Y)
sim('robotprueba3.slx')


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton9.
function pushbutton9_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
