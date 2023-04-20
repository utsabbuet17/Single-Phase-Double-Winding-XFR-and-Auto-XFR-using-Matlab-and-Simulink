function varargout = finalGuiProject(varargin)
% FINALGUIPROJECT MATLAB code for finalGuiProject.fig
%      FINALGUIPROJECT, by itself, creates a new FINALGUIPROJECT or raises the existing
%      singleton*.
%
%      H = FINALGUIPROJECT returns the handle to a new FINALGUIPROJECT or the handle to
%      the existing singleton*.
%
%      FINALGUIPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALGUIPROJECT.M with the given input arguments.
%
%      FINALGUIPROJECT('Property','Value',...) creates a new FINALGUIPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before finalGuiProject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to finalGuiProject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finalGuiProject

% Last Modified by GUIDE v2.5 17-Dec-2020 10:21:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finalGuiProject_OpeningFcn, ...
                   'gui_OutputFcn',  @finalGuiProject_OutputFcn, ...
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


% --- Executes just before finalGuiProject is made visible.
function finalGuiProject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to finalGuiProject (see VARARGIN)

% Choose default command line output for finalGuiProject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes finalGuiProject wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = finalGuiProject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
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

amplitude= set(handles.amp,'string','');
frequency=set(handles.freq,'string','');
phase= set(handles.p,'string','');
k = set(handles.a,'string','');
R1= set(handles.r1,'string','');
L1=set(handles.l1,'string','');
Ro=set(handles.ro,'string','');
Lo=set(handles.lo,'string','');
R2=set(handles.r2,'string','');
L2=set(handles.l2,'string','');
Rl=set(handles.rl,'string','');
Ll=set(handles.ll,'string','');

% --- Executes on button press in powerPlot.
function powerPlot_Callback(hObject, eventdata, handles)
% hObject    handle to powerPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amplitude frequency k R1 L1 Ro Lo R2 L2 Rl Ll phase

amplitude= str2num(get(handles.amp,'string'));
frequency=str2num(get(handles.freq,'string'));
phase = str2num(get(handles.p,'string'));
k = str2num(get(handles.a,'string'));
R1= str2num(get(handles.r1,'string'));
L1=str2num(get(handles.l1,'string'));
Ro=str2num(get(handles.ro,'string'));
Lo=str2num(get(handles.lo,'string'));
R2=str2num(get(handles.r2,'string'));
L2=str2num(get(handles.l2,'string'));
Rl=str2num(get(handles.rl,'string'));
Ll=str2num(get(handles.ll,'string'));

tP=str2num(get(handles.cP,'string'));
tfinalp= (1/frequency ) * tP;
open_system('ProjectFinal/POWER');
sim('ProjectFinal',tfinalp/2);


function cP_Callback(hObject, eventdata, handles)
% hObject    handle to cP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cP as text
%        str2double(get(hObject,'String')) returns contents of cP as a double


% --- Executes during object creation, after setting all properties.
function cP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in currentPlot.
function currentPlot_Callback(hObject, eventdata, handles)
% hObject    handle to currentPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amplitude frequency k R1 L1 Ro Lo R2 L2 Rl Ll phase
amplitude= str2num(get(handles.amp,'string'));
frequency=str2num(get(handles.freq,'string'));
phase = str2num(get(handles.p,'string'));
k = str2num(get(handles.a,'string'));
R1= str2num(get(handles.r1,'string'));
L1=str2num(get(handles.l1,'string'));
Ro=str2num(get(handles.ro,'string'));
Lo=str2num(get(handles.lo,'string'));
R2=str2num(get(handles.r2,'string'));
L2=str2num(get(handles.l2,'string'));
Rl=str2num(get(handles.rl,'string'));
Ll=str2num(get(handles.ll,'string'));
tI=str2num(get(handles.cI,'string'));
tfinali= (1/frequency ) * tI;
open_system('ProjectFinal/CURRENT');
sim('ProjectFinal',tfinali);

% --- Executes on button press in voltagePlot.
function voltagePlot_Callback(hObject, eventdata, handles)
% hObject    handle to voltagePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amplitude frequency k R1 L1 Ro Lo R2 L2 Rl Ll phase

amplitude= str2num(get(handles.amp,'string'));
frequency=str2num(get(handles.freq,'string'));
phase = str2num(get(handles.p,'string'));
k = str2num(get(handles.a,'string'));
R1= str2num(get(handles.r1,'string'));
L1=str2num(get(handles.l1,'string'));
Ro=str2num(get(handles.ro,'string'));
Lo=str2num(get(handles.lo,'string'));
R2=str2num(get(handles.r2,'string'));
L2=str2num(get(handles.l2,'string'));
Rl=str2num(get(handles.rl,'string'));
Ll=str2num(get(handles.ll,'string'));

tV=str2num(get(handles.cV,'string'));
tfinalv= (1/frequency ) * tV;
open_system('ProjectFinal/VOLTAGE');
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



function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l2 as text
%        str2double(get(hObject,'String')) returns contents of l2 as a double


% --- Executes during object creation, after setting all properties.
function l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r2_Callback(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r2 as text
%        str2double(get(hObject,'String')) returns contents of r2 as a double


% --- Executes during object creation, after setting all properties.
function r2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1 as text
%        str2double(get(hObject,'String')) returns contents of r1 as a double


% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1 as text
%        str2double(get(hObject,'String')) returns contents of l1 as a double


% --- Executes during object creation, after setting all properties.
function l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ro_Callback(hObject, eventdata, handles)
% hObject    handle to ro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ro as text
%        str2double(get(hObject,'String')) returns contents of ro as a double


% --- Executes during object creation, after setting all properties.
function ro_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lo_Callback(hObject, eventdata, handles)
% hObject    handle to lo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lo as text
%        str2double(get(hObject,'String')) returns contents of lo as a double


% --- Executes during object creation, after setting all properties.
function lo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rl_Callback(hObject, eventdata, handles)
% hObject    handle to rl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rl as text
%        str2double(get(hObject,'String')) returns contents of rl as a double


% --- Executes during object creation, after setting all properties.
function rl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ll_Callback(hObject, eventdata, handles)
% hObject    handle to ll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ll as text
%        str2double(get(hObject,'String')) returns contents of ll as a double


% --- Executes during object creation, after setting all properties.
function ll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_Callback(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p as text
%        str2double(get(hObject,'String')) returns contents of p as a double


% --- Executes during object creation, after setting all properties.
function p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
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
