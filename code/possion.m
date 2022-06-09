function varargout = possion(varargin)
% POSSION MATLAB code for possion.fig
%      POSSION, by itself, creates a new POSSION or raises the existing
%      singleton*.
%
%      H = POSSION returns the handle to a new POSSION or the handle to
%      the existing singleton*.
%
%      POSSION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POSSION.M with the given input arguments.
%
%      POSSION('Property','Value',...) creates a new POSSION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before possion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to possion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help possion

% Last Modified by GUIDE v2.5 06-May-2022 23:09:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @possion_OpeningFcn, ...
                   'gui_OutputFcn',  @possion_OutputFcn, ...
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


% --- Executes just before possion is made visible.
function possion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to possion (see VARARGIN)

% Choose default command line output for possion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes possion wait for user response (see UIRESUME)
% uiwait(handles.possion);


% --- Outputs from this function are returned to the command line.
function varargout = possion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function possion_edit_Callback(hObject, eventdata, handles)
% hObject    handle to possion_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of possion_edit as text
%        str2double(get(hObject,'String')) returns contents of possion_edit as a double


% --- Executes during object creation, after setting all properties.
function possion_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to possion_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in possion_button.
function possion_button_Callback(hObject, eventdata, handles)
h = guihandles;
global possion_d;
possion_d = eval(get(h.possion_edit, 'String'));
uiresume(h.possion);
close;
% hObject    handle to possion_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
