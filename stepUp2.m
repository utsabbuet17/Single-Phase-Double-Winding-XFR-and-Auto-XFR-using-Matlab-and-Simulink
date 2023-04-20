function varargout = stepUp2(varargin)
% STEPUP2 MATLAB code for stepUp2.fig
%      STEPUP2, by itself, creates a new STEPUP2 or raises the existing
%      singleton*.
%
%      H = STEPUP2 returns the handle to a new STEPUP2 or the handle to
%      the existing singleton*.
%
%      STEPUP2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STEPUP2.M with the given input arguments.
%
%      STEPUP2('Property','Value',...) creates a new STEPUP2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before stepUp2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to stepUp2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stepUp2

% Last Modified by GUIDE v2.5 17-Dec-2020 18:08:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stepUp2_OpeningFcn, ...
                   'gui_OutputFcn',  @stepUp2_OutputFcn, ...
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


% --- Executes just before stepUp2 is made visible.
function stepUp2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to stepUp2 (see VARARGIN)

% Choose default command line output for stepUp2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes stepUp2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = stepUp2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in clearButton.
function clearButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.s,'string','');
 set(handles.vl,'string','');
set(handles.freq,'string','');
set(handles.nc,'string','');
set(handles.nse,'string','');
set(handles.cV,'string','');
set(handles.cI,'string','');

% --- Executes on button press in currentPlot.
function currentPlot_Callback(hObject, eventdata, handles)
% hObject    handle to currentPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S Vl Nc Nse frequency
S = str2num(get(handles.s,'string'));
Vl = str2num(get(handles.vl,'string'));
frequency = str2num(get(handles.freq,'string'));
Nc = str2num(get(handles.nc,'string'));
Nse = str2num(get(handles.nse,'string'));

tI=str2num(get(handles.cI,'string'));
tfinali= (1/frequency ) * tI;
open_system('ProjectFinal/CURRENTAUTO1');
sim('ProjectFinal',tfinali);


function cI_Callback(hObject, eventdata, handles)
% hObject    handle to cI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cI as text
%        str2double(get(hObject,'String')) returns contents of cI as a double


% --- Executes during object creation, after setting all properties.
function cI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in voltagePlot.
function voltagePlot_Callback(hObject, eventdata, handles)
% hObject    handle to voltagePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global S Vl Nc Nse frequency
S = str2num(get(handles.s,'string'));
Vl = str2num(get(handles.vl,'string'));
frequency = str2num(get(handles.freq,'string'));
Nc = str2num(get(handles.nc,'string'));
Nse = str2num(get(handles.nse,'string'));

tV=str2num(get(handles.cV,'string'));
tfinalv= (1/frequency ) * tV;
open_system('ProjectFinal/VOLTAGEAUTO1');
sim('ProjectFinal',tfinalv);

function cV_Callback(hObject, eventdata, handles)
% hObject    handle to cV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cV as text
%        str2double(get(hObject,'String')) returns contents of cV as a double


% --- Executes during object creation, after setting all properties.
function cV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s_Callback(hObject, eventdata, handles)
% hObject    handle to s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s as text
%        str2double(get(hObject,'String')) returns contents of s as a double


% --- Executes during object creation, after setting all properties.
function s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vl_Callback(hObject, eventdata, handles)
% hObject    handle to vl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vl as text
%        str2double(get(hObject,'String')) returns contents of vl as a double


% --- Executes during object creation, after setting all properties.
function vl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_Callback(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq as text
%        str2double(get(hObject,'String')) returns contents of freq as a double


% --- Executes during object creation, after setting all properties.
function freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nc_Callback(hObject, eventdata, handles)
% hObject    handle to nc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nc as text
%        str2double(get(hObject,'String')) returns contents of nc as a double


% --- Executes during object creation, after setting all properties.
function nc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nse_Callback(hObject, eventdata, handles)
% hObject    handle to nse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nse as text
%        str2double(get(hObject,'String')) returns contents of nse as a double


% --- Executes during object creation, after setting all properties.
function nse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
