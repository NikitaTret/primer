function varargout = Nikita(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Nikita_OpeningFcn, ...
                   'gui_OutputFcn',  @Nikita_OutputFcn, ...
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
function Nikita_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Nikita_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

%Программирование выпадающего меню для первой матрицы, 
%определение количества строк.
function popupmenu1_Callback(hObject, eventdata, handles)
set(handles.uitable1, 'Visible' ,'on');
n=get(hObject,'Value');
Dat=zeros(n+1,n+1);
A=true(1,n+2);
set(handles.uitable1,'Data',Dat,'ColumnEditable',A)




function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%Определение количества столбцов для второй матрицы.
function popupmenu3_Callback(hObject2, eventdata, handles)
set(handles.uitable2, 'Visible' ,'on');
m=get(hObject2,'Value');
Dat2=zeros(m+1,m+1);
B=true(1,m+2);
set(handles.uitable2,'Data',Dat2,'ColumnEditable',B)

function popupmenu3_CreateFcn(hObject2, eventdata, handles)

if ispc && isequal(get(hObject2,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Произведение
function pushbutton1_Callback(hObject, eventdata, handles)
%n=get(handles.popupmenu1,'Value');
A=get(handles.uitable1,'Data');
B=get(handles.uitable2,'Data');
x=A*B;
set(handles.text4,'String',num2str(x), 'Visible', 'On')


% Сложение pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%n=get(handles.popupmenu1,'Value');
A=get(handles.uitable1,'Data');
B=get(handles.uitable2,'Data');
x=A+B;
set(handles.text4,'String',num2str(x), 'Visible', 'On')


% Вычитание pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
%n=get(handles.popupmenu1,'Value');
A=get(handles.uitable1,'Data');
B=get(handles.uitable2,'Data');
x=A-B;
set(handles.text4,'String',num2str(x), 'Visible', 'On')


% Транспонирование A in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
%n=get(handles.popupmenu1,'Value');
A=get(handles.uitable1,'Data');
x=A.';
set(handles.text4,'String',num2str(x),'Visible', 'On')


% Обратная A pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
%n=get(handles.popupmenu1,'Value');
A=get(handles.uitable1,'Data');
x=inv(A);
set(handles.text4,'String',num2str(x),'Visible', 'On')


% Возведение в квадрат А pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
%n=get(handles.popupmenu1,'Value');
A=get(handles.uitable1,'Data');
x=A^2;
set(handles.text4,'String',num2str(x),'Visible', 'On')
