function varargout = prewitt(varargin)
% PREWITT MATLAB code for prewitt.fig
%      PREWITT, by itself, creates a new PREWITT or raises the existing
%      singleton*.
%
%      H = PREWITT returns the handle to a new PREWITT or the handle to
%      the existing singleton*.
%
%      PREWITT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREWITT.M with the given input arguments.
%
%      PREWITT('Property','Value',...) creates a new PREWITT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prewitt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prewitt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prewitt

% Last Modified by GUIDE v2.5 07-May-2022 02:30:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prewitt_OpeningFcn, ...
                   'gui_OutputFcn',  @prewitt_OutputFcn, ...
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


% --- Executes just before prewitt is made visible.
function prewitt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to prewitt (see VARARGIN)

% Choose default command line output for prewitt
handles.output = hObject;
set(gcf,'CloseRequestFcn','');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes prewitt wait for user response (see UIRESUME)
% uiwait(handles.prewitt);


% --- Outputs from this function are returned to the command line.
function varargout = prewitt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function prewitt_edit_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prewitt_edit as text
%        str2double(get(hObject,'String')) returns contents of prewitt_edit as a double


% --- Executes during object creation, after setting all properties.
function prewitt_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prewitt_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in prewitt_button.
function prewitt_button_Callback(hObject, eventdata, handles)
h = guihandles;
uiresume(h.prewitt);
global prewitt_T prewitt_flag;
prewitt_T = eval(get(h.prewitt_edit, 'String'));
prewitt_flag = 1;
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to prewitt_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in prewitt_button2.
function prewitt_button2_Callback(hObject, eventdata, handles)
h = guihandles;
global prewitt_flag;
prewitt_flag = 0;
uiresume(h.prewitt);
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to prewitt_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
