function varargout = canny(varargin)
% CANNY MATLAB code for canny.fig
%      CANNY, by itself, creates a new CANNY or raises the existing
%      singleton*.
%
%      H = CANNY returns the handle to a new CANNY or the handle to
%      the existing singleton*.
%
%      CANNY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CANNY.M with the given input arguments.
%
%      CANNY('Property','Value',...) creates a new CANNY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before canny_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to canny_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help canny

% Last Modified by GUIDE v2.5 07-May-2022 14:51:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @canny_OpeningFcn, ...
                   'gui_OutputFcn',  @canny_OutputFcn, ...
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


% --- Executes just before canny is made visible.
function canny_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to canny (see VARARGIN)

% Choose default command line output for canny
handles.output = hObject;

% Update handles structure
set(gcf,'CloseRequestFcn','');
guidata(hObject, handles);

% UIWAIT makes canny wait for user response (see UIRESUME)
% uiwait(handles.canny);


% --- Outputs from this function are returned to the command line.
function varargout = canny_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function canny_edit1_Callback(hObject, eventdata, handles)
% hObject    handle to canny_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of canny_edit1 as text
%        str2double(get(hObject,'String')) returns contents of canny_edit1 as a double


% --- Executes during object creation, after setting all properties.
function canny_edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to canny_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in canny_button.
function canny_button_Callback(hObject, eventdata, handles)
h = guihandles;
uiresume(h.canny);
global canny_sigma canny_T1 canny_T2 canny_flag;
canny_sigma = eval(get(h.canny_edit1, 'String'));
canny_T2 = eval(get(h.canny_edit2, 'String'));
canny_T1 = eval(get(h.canny_edit3, 'String'));
canny_flag = 1;
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to canny_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function canny_edit2_Callback(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text3 as text
%        str2double(get(hObject,'String')) returns contents of text3 as a double


% --- Executes during object creation, after setting all properties.
function canny_edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in canny_button2.
function canny_button2_Callback(hObject, eventdata, handles)
h = guihandles;
global canny_flag;
canny_flag = 0;
uiresume(h.canny);
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to canny_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function canny_edit3_Callback(hObject, eventdata, handles)
% hObject    handle to canny_edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of canny_edit3 as text
%        str2double(get(hObject,'String')) returns contents of canny_edit3 as a double


% --- Executes during object creation, after setting all properties.
function canny_edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to canny_edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
