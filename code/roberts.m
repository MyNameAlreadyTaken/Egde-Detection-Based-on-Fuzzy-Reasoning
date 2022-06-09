function varargout = roberts(varargin)
% ROBERTS MATLAB code for roberts.fig
%      ROBERTS, by itself, creates a new ROBERTS or raises the existing
%      singleton*.
%
%      H = ROBERTS returns the handle to a new ROBERTS or the handle to
%      the existing singleton*.
%
%      ROBERTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBERTS.M with the given input arguments.
%
%      ROBERTS('Property','Value',...) creates a new ROBERTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before roberts_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to roberts_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help roberts

% Last Modified by GUIDE v2.5 07-May-2022 02:13:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @roberts_OpeningFcn, ...
                   'gui_OutputFcn',  @roberts_OutputFcn, ...
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


% --- Executes just before roberts is made visible.
function roberts_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to roberts (see VARARGIN)

% Choose default command line output for roberts
handles.output = hObject;

% Update handles structure
set(gcf,'CloseRequestFcn','');
guidata(hObject, handles);
% UIWAIT makes roberts wait for user response (see UIRESUME)
%uiwait(handles.roberts);


% --- Outputs from this function are returned to the command line.
function varargout = roberts_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%delete(handles.roberts);


function roberts_edit_Callback(hObject, eventdata, handles)
% hObject    handle to roberts_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of roberts_edit as text
%        str2double(get(hObject,'String')) returns contents of roberts_edit as a double


% --- Executes during object creation, after setting all properties.
function roberts_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roberts_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in roberts_button.
function roberts_button_Callback(hObject, eventdata, handles)
h = guihandles;
uiresume(h.roberts);
global roberts_T roberts_flag;
roberts_flag = 1;
roberts_T = eval(get(h.roberts_edit, 'String'));
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to roberts_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in roberts_button2.
function roberts_button2_Callback(hObject, eventdata, handles)
h = guihandles;
global roberts_flag;
roberts_flag = 0;
uiresume(h.roberts);
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to roberts_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
