function varargout = gpassignment(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gpassignment_OpeningFcn, ...
                   'gui_OutputFcn',  @gpassignment_OutputFcn, ...
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

function gpassignment_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = gpassignment_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

function amount_Callback(hObject, ~, handles)
amount=get(hObject,'String');
amount_num=str2double(amount);
handles.amount_num=amount_num;
guidata(hObject,handles);

function amount_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
   
function yearly_interest_Callback(hObject, ~, handles)
yearly_interest=get(hObject,'String');
yearly_interest_num=str2double(yearly_interest);
handles.yearly_interest_num=yearly_interest_num;
guidata(hObject,handles);

function yearly_interest_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function monthly_Callback(hObject, ~, handles)
monthly=get(hObject,'String');
monthly_num=str2double(monthly);
handles.monthly_num=monthly_num;
guidata(hObject,handles);
breaker=0; 

function monthly_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate_Callback(hObject, ~, handles)

amount_num=handles.amount_num;
yearly_interest_num=handles.yearly_interest_num;
monthly_num=handles.monthly_num;
guidata(hObject,handles);

if amount_num<=0 || yearly_interest_num<=0 || monthly_num<=0
   errordlg('You have entered a negative number','Error');
%     for i=1:inf
%         i;
%         amount_num;
%         dataD{i,1}='Invalid';
%         dataD{i,2}='Invalid';
%         dataD{i,3}='Invalid';
%         dataD{i,4}='Invalid';
%         dataD{i,5}='Invalid';
%         break;
%     end
%     set(handles.table,'data',dataD);
end
if  amount_num<5000    
    errordlg('Loan amount must be more than 5000','Error');
    return;
%     for i=1:inf
%         i;
%         amount_num;
%         dataD{i,1}='Invalid';
%         dataD{i,2}='Invalid';
%         dataD{i,3}='Invalid';
%         dataD{i,4}='Invalid';
%         dataD{i,5}='Invalid';
%         break;
%     end
%     set(handles.table,'data',dataD);
end
if  yearly_interest_num<1.5
    warndlg('Yearly interest rate must be at least 1.5','Wrong sign');
    return;
%     for i=1:inf
%         i;
%         amount_num;
%         dataD{i,1}='Invalid';
%         dataD{i,2}='Invalid';
%         dataD{i,3}='Invalid';
%         dataD{i,4}='Invalid';
%         dataD{i,5}='Invalid';
%         break;
%     end
%     set(handles.table,'data',dataD);
end

monthly_interest=(yearly_interest_num/12)*amount_num;

while monthly_num<monthly_interest

    button=questdlg('Monthly payment too small,can’t be less than interest.Do you want to re-enter?','Error','Yes','No','Yes');

    if strcmp(button,'No')
        close
        breaker=0;
    return

    else
    prompt={'Monthly Payment : '};
    name = 'Please re-enter the new monthly payment value';
    numlines=1;
    defaultanswer={'0'};
    options.Resize='on';
    answer_reenter=inputdlg(prompt,name,numlines,defaultanswer,options);
    breaker=0;

    monthly=answer_reenter{1};
    monthly_num=str2double(monthly);
    end
end

     beginning_balance=amount_num;
     beginning_balance_str=num2str(beginning_balance);
     monthly_payment=monthly_num;
     monthly_payment_str=num2str(monthly_payment);     
     sum_interest=0;
     x=0;
     
  for i=1:inf
      i;
      beginning_balance;
      if monthly_payment>beginning_balance
          beginning_balance_str=num2str(beginning_balance);
          monthly_payment=beginning_balance;
          monthly_payment_str=num2str(monthly_payment); 
          monthly_interest_str=num2str(0);
          principal_str=monthly_payment_str;
          ending_balance_str=num2str(0);
          dataS{i,1}=beginning_balance_str;
          dataS{i,2}=monthly_payment_str;
          dataS{i,3}=monthly_interest_str;
          dataS{i,4}=principal_str;
          dataS{i,5}=ending_balance_str;
          break;
      end
          
      monthly_interest=(yearly_interest_num/12)*beginning_balance;
      monthly_interest_str=num2str(monthly_interest);
      monthly_interest_rounded=round(monthly_interest,2);
      monthly_interest_rounded_str=num2str(monthly_interest_rounded);
      principal=monthly_payment-monthly_interest_rounded;
      principal_str=num2str(principal);
      ending_balance=beginning_balance-principal;
      ending_balance_str=num2str(ending_balance);
      dataS{i,1}=beginning_balance_str;
      dataS{i,2}=monthly_payment_str;
      dataS{i,3}=monthly_interest_rounded_str;
      dataS{i,4}=principal_str;
      dataS{i,5}=ending_balance_str;
      beginning_balance=ending_balance;
      beginning_balance_str=num2str(beginning_balance);
      sum_interest=sum_interest+monthly_interest_rounded;
      x= x + 1;
  end
   
set(handles.table,'data',dataS);

total_repayment=amount_num+sum_interest;
total_repayment=round(total_repayment,2);
set(handles.repayment,'String',total_repayment)

sum_interest=round(sum_interest,2);
set(handles.interestt,'String',sum_interest)

function file_Callback(hObject, eventdata, handles)

function print_Callback(hObject, eventdata, handles)
printdlg(handles.fig1)

function close_Callback(hObject, eventdata, handles)
selection = questdlg(['Close ' get(handles.fig1,'Name') '?'],...
                     ['Close ' get(handles.fig1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.fig1) 

function sum_interest_Callback(hObject, eventdata, handles)
% hObject    handle to interestt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interestt as text
%        str2double(get(hObject,'String')) returns contents of interestt as a double

% --- Executes during object creation, after setting all properties.
function interestt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interestt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function total_repayment_Callback(hObject, eventdata, handles)
% hObject    handle to repayment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of repayment as text
%        str2double(get(hObject,'String')) returns contents of repayment as a double

% --- Executes during object creation, after setting all properties.
function repayment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to repayment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.amount,'String',''); 
set(handles.yearly_interest,'String','');
set(handles.monthly, 'String','');
set(handles.repayment,'String',''); 
set(handles.interestt,'String','');
set(handles.table,'Data','');
guidata(hObject, handles);
