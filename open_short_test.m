function varargout = open_short_test(varargin)
% OPEN_SHORT_TEST MATLAB code for open_short_test.fig
%      OPEN_SHORT_TEST, by itself, creates a new OPEN_SHORT_TEST or raises the existing
%      singleton*.
%
%      H = OPEN_SHORT_TEST returns the handle to a new OPEN_SHORT_TEST or the handle to
%      the existing singleton*.
%
%      OPEN_SHORT_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPEN_SHORT_TEST.M with the given input arguments.
%
%      OPEN_SHORT_TEST('Property','Value',...) creates a new OPEN_SHORT_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before open_short_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to open_short_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help open_short_test

% Last Modified by GUIDE v2.5 17-Dec-2020 22:14:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @open_short_test_OpeningFcn, ...
                   'gui_OutputFcn',  @open_short_test_OutputFcn, ...
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


% --- Executes just before open_short_test is made visible.
function open_short_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to open_short_test (see VARARGIN)

% Choose default command line output for open_short_test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes open_short_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = open_short_test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in voltagePlot.
function voltagePlot_Callback(hObject, eventdata, handles)
% hObject    handle to voltagePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amplitude frequency Voc Ioc Poc Vsc Isc Psc Lm Rm Req Leq

frequency=str2num(get(handles.freq,'string'));
amplitude= str2num(get(handles.amp,'string'));
Voc = str2num(get(handles.voc,'string'));
Ioc= str2num(get(handles.ioc,'string'));
Poc=str2num(get(handles.poc,'string'));
Vsc=str2num(get(handles.vsc,'string'));
Isc=str2num(get(handles.isc,'string'));
Psc=str2num(get(handles.psc,'string'));

Rm=(Voc)^2/Poc
Req=Psc/Isc^2
Lm=Voc^2/(sqrt((Voc*Ioc)^2-Poc^2)*2*pi*frequency)
Leq=sqrt((Vsc*Isc)^2-(Psc)^2)/((Isc^2)*2*pi*frequency)

tV=str2num(get(handles.cV,'string'));
tfinalv= (1/frequency ) * tV;
open_system('ProjectFinal/VOLTAGETEST');
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



function vsc_Callback(hObject, eventdata, handles)
% hObject    handle to vsc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vsc as text
%        str2double(get(hObject,'String')) returns contents of vsc as a double


% --- Executes during object creation, after setting all properties.
function vsc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vsc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function isc_Callback(hObject, eventdata, handles)
% hObject    handle to isc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of isc as text
%        str2double(get(hObject,'String')) returns contents of isc as a double


% --- Executes during object creation, after setting all properties.
function isc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to isc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psc_Callback(hObject, eventdata, handles)
% hObject    handle to psc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psc as text
%        str2double(get(hObject,'String')) returns contents of psc as a double


% --- Executes during object creation, after setting all properties.
function psc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function voc_Callback(hObject, eventdata, handles)
% hObject    handle to voc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voc as text
%        str2double(get(hObject,'String')) returns contents of voc as a double


% --- Executes during object creation, after setting all properties.
function voc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ioc_Callback(hObject, eventdata, handles)
% hObject    handle to ioc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ioc as text
%        str2double(get(hObject,'String')) returns contents of ioc as a double


% --- Executes during object creation, after setting all properties.
function ioc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ioc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function poc_Callback(hObject, eventdata, handles)
% hObject    handle to poc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of poc as text
%        str2double(get(hObject,'String')) returns contents of poc as a double


% --- Executes during object creation, after setting all properties.
function poc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to poc (see GCBO)
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



function amp_Callback(hObject, eventdata, handles)
% hObject    handle to amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amp as text
%        str2double(get(hObject,'String')) returns contents of amp as a double


% --- Executes during object creation, after setting all properties.
function amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearButton.
function clearButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(handles.amp,'string','');
set(handles.freq,'string','');

 set(handles.voc,'string','');
set(handles.ioc,'string','');
set(handles.poc,'string','');
set(handles.vsc,'string','');
set(handles.isc,'string','');
set(handles.psc,'string','');
set(handles.cV,'string','');



