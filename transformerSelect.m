function varargout = transformerSelect(varargin)
% TRANSFORMERSELECT MATLAB code for transformerSelect.fig
%      TRANSFORMERSELECT, by itself, creates a new TRANSFORMERSELECT or raises the existing
%      singleton*.
%
%      H = TRANSFORMERSELECT returns the handle to a new TRANSFORMERSELECT or the handle to
%      the existing singleton*.
%
%      TRANSFORMERSELECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSFORMERSELECT.M with the given input arguments.
%
%      TRANSFORMERSELECT('Property','Value',...) creates a new TRANSFORMERSELECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transformerSelect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transformerSelect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transformerSelect

% Last Modified by GUIDE v2.5 17-Dec-2020 18:37:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transformerSelect_OpeningFcn, ...
                   'gui_OutputFcn',  @transformerSelect_OutputFcn, ...
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


% --- Executes just before transformerSelect is made visible.
function transformerSelect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transformerSelect (see VARARGIN)

% Choose default command line output for transformerSelect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transformerSelect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transformerSelect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in singlePhase.
function singlePhase_Callback(hObject, eventdata, handles)
% hObject    handle to singlePhase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amplitude frequency k R1 L1 Ro Lo R2 L2 Rl Ll phase S Vh Nc Nse Vl
finalGuiProject;

% --- Executes on button press in auto.
function auto_Callback(hObject, eventdata, handles)
% hObject    handle to auto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uporDown;
