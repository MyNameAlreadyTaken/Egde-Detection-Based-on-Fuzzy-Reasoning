function varargout = gaussian(varargin)
% GAUSSIAN MATLAB code for gaussian.fig
%      GAUSSIAN, by itself, creates a new GAUSSIAN or raises the existing
%      singleton*.
%
%      H = GAUSSIAN returns the handle to a new GAUSSIAN or the handle to
%      the existing singleton*.
%
%      GAUSSIAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAUSSIAN.M with the given input arguments.
%
%      GAUSSIAN('Property','Value',...) creates a new GAUSSIAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gaussian_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gaussian_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gaussian

% Last Modified by GUIDE v2.5 07-May-2022 03:00:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gaussian_OpeningFcn, ...
                   'gui_OutputFcn',  @gaussian_OutputFcn, ...
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


% --- Executes just before gaussian is made visible.
function gaussian_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gaussian (see VARARGIN)

% Choose default command line output for gaussian
handles.output = hObject;

% Update handles structure
set(gcf,'CloseRequestFcn','');
guidata(hObject, handles);

% UIWAIT makes gaussian wait for user response (see UIRESUME)
% uiwait(handles.gaussian);


% --- Outputs from this function are returned to the command line.
function varargout = gaussian_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function gaussian_edit1_Callback(hObject, eventdata, handles)
% hObject    handle to gaussian_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gaussian_edit1 as text
%        str2double(get(hObject,'String')) returns contents of gaussian_edit1 as a double


% --- Executes during object creation, after setting all properties.
function gaussian_edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gaussian_edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gaussian_button.
function gaussian_button_Callback(hObject, eventdata, handles)
h = guihandles;
uiresume(h.gaussian);
global gaussian_m gaussian_v gaussian_flag;
gaussian_m = eval(get(h.gaussian_edit1, 'String'));
gaussian_v = eval(get(h.gaussian_edit2, 'String'));
gaussian_flag = 1;
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to gaussian_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function gaussian_edit2_Callback(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text3 as text
%        str2double(get(hObject,'String')) returns contents of text3 as a double


% --- Executes during object creation, after setting all properties.
function gaussian_edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in guassian_button2.
function guassian_button2_Callback(hObject, eventdata, handles)
h = guihandles;
global gaussian_flag;
gaussian_flag = 0;
uiresume(h.gaussian);
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to guassian_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
