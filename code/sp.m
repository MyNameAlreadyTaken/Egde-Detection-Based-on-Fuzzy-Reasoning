function varargout = sp(varargin)
% SP MATLAB code for sp.fig
%      SP, by itself, creates a new SP or raises the existing
%      singleton*.
%
%      H = SP returns the handle to a new SP or the handle to
%      the existing singleton*.
%
%      SP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SP.M with the given input arguments.
%
%      SP('Property','Value',...) creates a new SP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sp

% Last Modified by GUIDE v2.5 07-May-2022 02:50:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sp_OpeningFcn, ...
                   'gui_OutputFcn',  @sp_OutputFcn, ...
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


% --- Executes just before sp is made visible.
function sp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sp (see VARARGIN)

% Choose default command line output for sp
handles.output = hObject;

% Update handles structure
set(gcf,'CloseRequestFcn','');
guidata(hObject, handles);

% UIWAIT makes sp wait for user response (see UIRESUME)
% uiwait(handles.sp);


% --- Outputs from this function are returned to the command line.
function varargout = sp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sp_edit_Callback(hObject, eventdata, handles)
% hObject    handle to sp_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sp_edit as text
%        str2double(get(hObject,'String')) returns contents of sp_edit as a double


% --- Executes during object creation, after setting all properties.
function sp_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sp_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sp_button.
function sp_button_Callback(hObject, eventdata, handles)
h = guihandles;
uiresume(h.sp);
global sp_d sp_flag;
sp_d = eval(get(h.sp_edit, 'String'));
sp_flag = 1;
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to sp_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sp_button2.
function sp_button2_Callback(hObject, eventdata, handles)
h = guihandles;
global sp_flag;
sp_flag = 0;
uiresume(h.sp);
set(gcf,'CloseRequestFcn','closereq');
close;
% hObject    handle to sp_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
