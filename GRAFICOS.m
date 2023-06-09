function varargout = GRAFICOS(varargin)
% GRAFICOS MATLAB code for GRAFICOS.fig
%      GRAFICOS, by itself, creates a new GRAFICOS or raises the existing
%      singleton*.
%
%      H = GRAFICOS returns the handle to a new GRAFICOS or the handle to
%      the existing singleton*.
%
%      GRAFICOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAFICOS.M with the given input arguments.
%
%      GRAFICOS('Property','Value',...) creates a new GRAFICOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GRAFICOS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GRAFICOS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GRAFICOS

% Last Modified by GUIDE v2.5 29-Apr-2021 13:55:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GRAFICOS_OpeningFcn, ...
                   'gui_OutputFcn',  @GRAFICOS_OutputFcn, ...
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


% --- Executes just before GRAFICOS is made visible.
function GRAFICOS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GRAFICOS (see VARARGIN)

% Choose default command line output for GRAFICOS
handles.output = hObject;

global contador;
delete(instrfind({'Port'},{'COM7'}));%En windows reemplace
pserial=serial('COM7');
pserial.BaudRate=9600;
fopen(pserial);

contador = 1;

temperatura = [];
luz = [];
distancia = [];

while true
datain=fread(pserial, 70);
aux1=char(datain);
aux2=char(aux1);

% LM35
temperatura(1) = ((aux2(1)*100) + (aux2(2)*10) + aux2(3)) - 5328;
temperatura(2) = ((aux2(4)*100) + (aux2(5)*10) + aux2(6)) - 5328;
temperatura(3) = ((aux2(7)*100) + (aux2(8)*10) + aux2(9)) - 5328;
temperatura(4) = ((aux2(10)*100) + (aux2(11)*10) + aux2(12)) - 5328;
temperatura(5) = ((aux2(13)*100) + (aux2(14)*10) + aux2(15)) - 5328;
temperatura(6) = ((aux2(16)*100) + (aux2(17)*10) + aux2(18)) - 5328;
temperatura(7) = ((aux2(19)*100) + (aux2(20)*10) + aux2(21)) - 5328;
temperatura(8) = ((aux2(22)*100) + (aux2(23)*10) + aux2(24)) - 5328;
temperatura(9) = ((aux2(25)*100) + (aux2(26)*10) + aux2(27)) - 5328;
temperatura(10) = ((aux2(28)*100) + (aux2(29)*10) + aux2(30)) - 5328;

% Fotoresistencia
luz(1) = ((aux2(31)*10) + aux2(32)) - 528;
luz(2) = ((aux2(33)*10) + aux2(34)) - 528;
luz(3) = ((aux2(35)*10) + aux2(36)) - 528;
luz(4) = ((aux2(37)*10) + aux2(38)) - 528;
luz(5) = ((aux2(39)*10) + aux2(40)) - 528;
luz(6) = ((aux2(41)*10) + aux2(42)) - 528;
luz(7) = ((aux2(43)*10) + aux2(44)) - 528;
luz(8) = ((aux2(45)*10) + aux2(46)) - 528;
luz(9) = ((aux2(47)*10) + aux2(48)) - 528;
luz(10) = ((aux2(49)*10) + aux2(50)) - 528;

% SHARP
distancia(1) = (aux2(51)*10) + aux2(52);
distancia(2) = (aux2(53)*10) + aux2(54);
distancia(3) = (aux2(55)*10) + aux2(56);
distancia(4) = (aux2(57)*10) + aux2(58);
distancia(5) = (aux2(59)*10) + aux2(60);
distancia(6) = (aux2(61)*10) + aux2(62);
distancia(7) = (aux2(63)*10) + aux2(64);
distancia(8) = (aux2(65)*10) + aux2(66);
distancia(9) = (aux2(67)*10) + aux2(68);
distancia(10) = (aux2(69)*10) + aux2(70);

ylim([0 160]);
xlim([0 contador + 40]);
tempe(contador) = temperatura(1);
foto(contador) = luz(1);
dist(contador) = distancia(1);


% GRAFICA 1 TEMPERATURA (MUESTRAS / S)
plot(handles.axes1,tempe);

% GRAFICA 2 LUZ (MUESTRAS / S)
plot(handles.axes2,luz);

% GRAFICA 3 DISTANCIA (MUESTRAS / S)
plot(handles.axes3,dist);
contador = contador + 1;
end





% tempe = [1 2 3 4 5 6 7 8 9];
% foto = [9 8 7 6 5 4 3 2 1];
% dist = [3 2 1 8 9 4 2 4 6];
% 
% 
% % GRAFICA 1 TEMPERATURA (MUESTRAS / S)
% plot(handles.axes1,tempe);
% % GRAFICA 2 LUZ (MUESTRAS / S)
% plot(handles.axes2,foto);
% % GRAFICA 3 DISTANCIA (MUESTRAS / S)
% plot(handles.axes3,dist);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GRAFICOS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GRAFICOS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
