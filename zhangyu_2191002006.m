function varargout = zhangyu_2191002006(varargin)
% ZHANGYU_2191002006 MATLAB code for zhangyu_2191002006.fig
%      ZHANGYU_2191002006, by itself, creates a new ZHANGYU_2191002006 or raises the existing
%      singleton*.
%
%      H = ZHANGYU_2191002006 returns the handle to a new ZHANGYU_2191002006 or the handle to
%      the existing singleton*.
%
%      ZHANGYU_2191002006('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZHANGYU_2191002006.M with the given input arguments.
%
%      ZHANGYU_2191002006('Property','Value',...) creates a new ZHANGYU_2191002006 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zhangyu_2191002006_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zhangyu_2191002006_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zhangyu_2191002006

% Last Modified by GUIDE v2.5 28-Mar-2020 13:31:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @zhangyu_2191002006_OpeningFcn, ...
    'gui_OutputFcn',  @zhangyu_2191002006_OutputFcn, ...
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


% --- Executes just before zhangyu_2191002006 is made visible.
function zhangyu_2191002006_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zhangyu_2191002006 (see VARARGIN)

% Choose default command line output for zhangyu_2191002006

handles.output = hObject;
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
ii=imread('background.jfif');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','on');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zhangyu_2191002006 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zhangyu_2191002006_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global a ;
a=1;
if hObject == handles.rb1
    set(handles.tishi1,'String','从33个红色球号码中选出6个号码，再从16个蓝色球号码中选出1个号码，组成乐透式投注');
    set(handles.tishi2,'String','3d');
    set(handles.tishi3,'String','七乐彩');
    
    a =1;
elseif hObject == handles.rb2
    set(handles.tishi2,'String','以一个3位自然数为投注号码的彩票，投注者从000-999的数字中选择一个3位数进行投注');
    set(handles.tishi1,'String','双色球');
    set(handles.tishi3,'String','七乐彩');
    
    a=2;
elseif hObject == handles.rb3
    set(handles.tishi3,'String','从01—30共30个号码中选择7个号码组合为一注投注号码。');
    set(handles.tishi2,'String','3d');
    set(handles.tishi1,'String','双色球');
    
    a=3;
end


function zs_edit_Callback(hObject, eventdata, handles)
% hObject    handle to zs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zs_edit as text
%        str2double(get(hObject,'String')) returns contents of zs_edit as a double


% --- Executes during object creation, after setting all properties.
function zs_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbok.
function pbok_Callback(hObject, ~, handles)
% hObject    handle to pbok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
price = 0;
n = get(handles.zs_edit,'String');
n= str2num(n);
if(n<1||n>5)
    f = errordlg('您输入的值超出范围,请重新输入','输入错误');
else
    price = n*2;
    str1 = sprintf('您要花费 %d元，请问确定吗？',price);
    answer1 = questdlg(str1,'提示','确定','取消','取消');
    switch answer1
        case '确定'
            str2 = sprintf('您要购买的彩票注数是%d注，将花费%d元',n,price);
            answer2= questdlg(str2,'提示','确定','取消','取消');
            switch  answer2
                case '确定'
                    list = {'机选','自选'};
                    [indx,~] = listdlg('ListString',list,'SelectionMode','single','ListSize',[160,50]);
                    
                    switch indx
                        case 1  %机选产生号码
                            if a==1  %机选玩法 双色球
                                matrix_r  =ones(n,6);
                                matrix_b =ones(n,1);
                                for  i =1:n%生成n注彩票
                                    temp_r = round(rand(1,6)*33+1);
                                    matrix_r (i,1:6)=temp_r;
                                    temp_b = round(rand(1,1)*15+1);
                                    matrix_b(i,:) = temp_b;
                                end
                                set(handles.left_num,'String',num2str(matrix_r),'Visible','On');
                                set(handles.right_num,'String',num2str(matrix_b),'Visible','On');
                            elseif a==2 %机选玩法 3d
                                A = cell(n,1);
                                for i =1:n
                                    rand_3d = round(rand(1)*999);
                                    r=sprintf('%03d',rand_3d);
                                    r = cellstr(r);
                                    A(i,1) = r;
                                end
                                set(handles.left_num,'String',A,'Visible','On');
                                set(handles.right_num,'String','','Visible','off');
                                
                            elseif a ==3 %机选玩法 七乐彩
                                B = cell(n,1);
                                for i =1:n
                                    rand_ql = round(rand(1,7)*10+1);
                                    r=sprintf('%02d ',rand_ql);
                                    r = cellstr(r);
                                    B(i,1) =r;
                                end
                                set(handles.left_num,'String',B,'Visible','On');
                                set(handles.right_num,'String','','Visible','off');
                            end
                            
                        case 2 %自选产生号码
                            if a==1 %自选号码判断 双色球玩法
                                answer_list = cell(n,2);
                                for i =1:n
                                    prompt = {'请输入6个红色球号码','请输入1个蓝色球号码'};
                                    title = '请输入您要选择的双色球号码';
                                    dims = [1 50];
                                    options.Resize='on';
                                    options.WindowStyle='normal';
                                    options.Interpreter='tex';
                                    answer = inputdlg(prompt,title,dims,{'',''},options);
                                    answer = answer';
                                    answer_list(i,1) = answer(1,1);
                                    answer_list(i,2) = answer(1,2);
                                end
                                set(handles.left_num,'String',answer_list(:,1),'Visible','On');
                                set(handles.right_num,'String',answer_list(:,2),'Visible','On');                            elseif a ==2%3d玩法
                                
                            elseif a ==2 %自选玩法 3d
                                disp(a);
                                answer_list = cell(n,1);
                                for i =1:n
                                    prompt = {'请连续输入3个号码'};
                                    title = '请输入您要选择的双色球号码';
                                    dims = [1 50];
                                    
                                    options.Resize='on';
                                    options.WindowStyle='normal';
                                    options.Interpreter='tex';
                                    answer = inputdlg(prompt,title,dims,{''},options)
                                    answer_list(i,1) = answer;
                                    
                                end
                                set(handles.left_num,'String',answer_list(:,1),'Visible','On');
                                set(handles.right_num,'Visible','Off');
                            elseif a ==3%自选玩法，七乐彩
                                answer_list = cell(n,1);
                                for i =1:n
                                    prompt = {'请输入7个号码,以空格隔开'};
                                    title = '请输入';
                                    dims = [1 50];
                                    
                                    options.Resize='on';
                                    options.WindowStyle='normal';
                                    options.Interpreter='tex';
                                    answer = inputdlg(prompt,title,dims,{''},options)
                                    answer_list(i,1) = answer;
                                end
                                set(handles.left_num,'String',answer_list(:,1),'Visible','On');
                                set(handles.right_num,'Visible','Off');
                            end
                    end
                    %[indx,tf] = listdlg('ListString',list);
                case '取消'
                    
            end
        case '取消'
            
    end
end


% --- Executes when selected object is changed in uibuttongroup6.
function uibuttongroup6_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup6
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function left_num_Callback(hObject, eventdata, handles)
% hObject    handle to left_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of left_num as text
%        str2double(get(hObject,'String')) returns contents of left_num as a double


% --- Executes during object creation, after setting all properties.
function left_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to left_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function right_num_Callback(hObject, eventdata, handles)
% hObject    handle to right_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of right_num as text
%        str2double(get(hObject,'String')) returns contents of right_num as a double


% --- Executes during object creation, after setting all properties.
function right_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to right_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
button=questdlg('你确定退出吗？','退出程序','Yes','No','Yes');%内容，标题，选项，默认选项

if strcmp(button,'Yes')
    
    delete(hObject);
    
end

function figure1_DeleteFcn(hObject, eventdata, handles)

delete(hObject);


% --- Executes on button press in printPaper.
function printPaper_Callback(hObject, eventdata, handles)
% hObject    handle to printPaper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('哈哈');
% pfid = fopen('LPT:', 'w');
% fprint(pfid, 'something to be sent to the printer');
% fclose(pfid)
% print(printer);
print('-PMicrosoft Print to PDF');
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over printPaper.
function printPaper_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to printPaper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
