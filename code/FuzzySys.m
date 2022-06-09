function varargout = FuzzySys(varargin)
% FuzzySys MATLAB code for FuzzySys.fig
%      FuzzySys, by itself, creates a new FuzzySys or raises the existing
%      singleton*.
%
%      H = FuzzySys returns the handle to a new FuzzySys or the handle to
%      the existing singleton*.
%
%      FuzzySys('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FuzzySys.M with the given input arguments.
%
%      FuzzySys('Property','Value',...) creates a new FuzzySys or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FuzzySys_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FuzzySys_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FuzzySys

% Last Modified by GUIDE v2.5 10-May-2022 13:37:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FuzzySys_OpeningFcn, ...
                   'gui_OutputFcn',  @FuzzySys_OutputFcn, ...
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


% --- Executes just before FuzzySys is made visible.
function FuzzySys_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FuzzySys (see VARARGIN)

% Choose default command line output for FuzzySys
handles.output = hObject;
set(handles.radiobutton1, 'value', 1);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FuzzySys wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FuzzySys_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, ~, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file path]=uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, 'open the file');
image=[path file];
handles.file=image;
if (file==0)
    warndlg('choose one picture...') ;
end
[fpath, fname, fext]=fileparts(file);
validex=({'.bmp','.jpg','.jpeg','.png'});
found=0;
for (x=1:length(validex))
   if (strcmpi(fext,validex{x}))
       found=1;
     
set(handles.save,'Enable','on');
set(handles.exit,'Enable','on');
set(handles.g1,'Visible','on');
set(handles.g2,'Visible','on');
set(handles.g3,'Visible','on');
set(handles.g4,'Visible','on');
set(handles.n1,'Enable','on');
set(handles.n2,'Enable','on');
set(handles.n3,'Enable','on');
set(handles.Roberts,'Enable','on');
set(handles.Sobel,'Enable','on');
set(handles.Prewitt,'Enable','on');
set(handles.Canny,'Enable','on');

handles.img=imread(image);
handles.i=imread(image);
h = waitbar(0,'waiting...');
steps = 100;

for step = 1:steps
    waitbar(step / steps)
end
close(h) 
axes(handles.g1); 
cla; 
imshow(handles.img)
axes(handles.g4);
cla;
imshow(rgb2gray(handles.img));
guidata(hObject,handles);
break; 
end
end
if (found==0)
     errordlg('文件扩展名不正确，请从可用扩展名[.jpg、.jpeg、.bmp、.png]中选择文件','Image Format Error');
end


% --- Executes on button press in exit.
function exit_Callback(~, ~, ~)
close all;
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in save.
function save_Callback(~, ~, ~)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Roberts.
function Roberts_Callback(hObject, ~, handles)  %jpg
roberts();
uiwait(roberts);
global roberts_T roberts_flag;
if roberts_flag == 1
    I = getimage(handles.g1);
    J = roberts_edge_detection(I, roberts_T);
    axes(handles.g3);
    cla;
    imshow(J);
    if get(handles.radiobutton1, 'value') == 1
        figure
        imshow(J);
    end
end
%if numel(mysize)>2
%    handles.img=rgb2gray(handles.img);
%end
%I = double(handles.img)/255;
%J = roberts_edge_detection(handles.img);
%handles.img=edge(handles.img,'roberts');
%axes(handles.g3);
%cla;
%imshow(J);
%J = edge(rgb2gray(handles.img), 'roberts');
%imwrite(J, 'test\p3_roberts.jpg');
%figure
%imshow(J);
guidata(hObject,handles);
% hObject    handle to Roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, ~, handles) %jpg
sobel();
uiwait(sobel);
global sobel_T sobel_flag;
if sobel_flag == 1
    I = getimage(handles.g1);
    J = sobel_edge_detection(I, sobel_T);
    axes(handles.g3);
    cla;
    imshow(J);
    if get(handles.radiobutton1, 'value') == 1
        figure
        imshow(J);
    end
end
%if numel(mysize)>2
%    handles.img=rgb2gray(handles.img);
%end
%I = double(handles.img)/255;
%J = sobel_edge_detection(handles.img);
%handles.img=edge(handles.img,'sobel');
%axes(handles.g3);
%cla;
%imshow(J);
%J = edge(rgb2gray(handles.img), 'sobel');
%imwrite(J, 'test\p3_sobel.jpg');
%figure
%imshow(J);
guidata(hObject,handles);
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, ~, handles) %jpg
prewitt();
uiwait(prewitt);
global prewitt_T prewitt_flag;
if prewitt_flag == 1
    I = getimage(handles.g1);
    J = prewitt_edge_detection(I, prewitt_T);
    axes(handles.g3);
    cla;
    imshow(J);
    if get(handles.radiobutton1, 'value') == 1
        figure
        imshow(J);
    end
end
%handles.img=edge(handles.img,'prewitt');
%axes(handles.g3);
%cla;
%imshow(J);
%J = edge(rgb2gray(handles.img), 'prewitt');
%imwrite(J, 'test\p3_prewitt.jpg');
%h = guihandles;
%T = eval(get(h.prewitt_edit, 'String'));
%J = prewitt_edge_detection(handles.img, T);
%figure
%imshow(J);
guidata(hObject,handles);
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Canny.
function Canny_Callback(hObject, ~, handles)
canny();
uiwait(canny);
global canny_sigma canny_T1 canny_T2 canny_flag;
if canny_flag == 1
    I = getimage(handles.g1);
    J = edge(rgb2gray(I),'canny',[canny_T1, canny_T2], canny_sigma);
    axes(handles.g3);
    cla;
    imshow(J);
    if get(handles.radiobutton1, 'value') == 1
        figure
        imshow(J);
    end
end
guidata(hObject,handles);
% hObject    handle to Canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n1.
function n1_Callback(~, ~, handles)
gaussian();
uiwait(gaussian);
global gaussian_m gaussian_v gaussian_flag;
if gaussian_flag == 1
    temp = imnoise(handles.img, 'gaussian', gaussian_m, gaussian_v);
    axes(handles.g1);
    cla;
    imshow(temp);
    axes(handles.g4);
    cla;
    imshow(rgb2gray(temp));
    if get(handles.radiobutton1, 'value') == 1
        figure
        imshow(temp);
    end
end
% hObject    handle to n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n2.
function n2_Callback(~, ~, handles)
sp();
uiwait(sp);
global sp_d sp_flag;
if sp_flag == 1
    temp = imnoise(handles.img, 'salt & pepper', sp_d);
    axes(handles.g1);
    cla;
    imshow(temp);
    axes(handles.g4);
    cla;
    imshow(rgb2gray(temp));
    if get(handles.radiobutton1, 'value') == 1
        figure
        imshow(temp);
    end
end
% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n3.
function n3_Callback(~, ~, handles)
temp = imnoise(handles.img, 'poisson');
axes(handles.g1);
cla;
imshow(temp);
axes(handles.g4);
cla;
imshow(rgb2gray(temp));
if get(handles.radiobutton1, 'value') == 1
    figure
    imshow(temp);
end
% hObject    handle to n3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on open and none of its controls.
function open_KeyPressFcn(~, ~, ~)
% hObject    handle to open (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on exit and none of its controls.
function exit_KeyPressFcn(~, ~, ~)
% hObject    handle to exit (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fuzzy.
function fuzzy_Callback(~, ~, handles)
I = getimage(handles.g1);
I = fuzzy_edge_detection(I);
axes(handles.g2); 
cla;
imshow(I, []);
if get(handles.radiobutton1, 'value') == 1
    figure
    imshow(I);
end
% hObject    handle to fuzzy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tao.
function tao_Callback(~, ~, handles)
I = getimage(handles.g1);
I = tao_edge_detection(I);
axes(handles.g3);
cla;
imshow(I);
if get(handles.radiobutton1, 'value') == 1
    figure
    imshow(I);
end
% hObject    handle to tao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in judge.
%function judge_Callback(hObject, eventdata, handles)
%temp = imread('test\p3_prewitt.jpg');
%tst = imread('test\p3edge.jpg');
%test(temp, tst)
% hObject    handle to judge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset.
function reset_Callback(~, ~, handles)
axes(handles.g1);
cla;
imshow(handles.img);
axes(handles.g4);
cla;
imshow(rgb2gray(handles.img));
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clear.
function clear_Callback(~, ~, handles)
axes(handles.g1);
cla reset;
axes(handles.g2);
cla reset;
axes(handles.g3);
cla reset;
axes(handles.g4);
cla reset;
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(~, ~, ~)

% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
