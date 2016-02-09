%clear;

%Change in accuracy with increasing values of K

n_classes=42;
maxK=n_classes;  

button_k=4;
checkbox_k=4;
radiobutton_k=4;
togglebutton_k=4;
switch_k=4;
edittext_k=4;
spinner_k=4;
spinner_button_k=4;
picker_k=4;
test_all_err=[];

%fs from ens_svm_1c_wt
fs=[
'11110000001', %button
'11110000001', %checkbox
'11100000001', %radiobutton
'11100000001', %togglebutton
'11110100001', %switch
'10100000001', %edittext
'10100000001', %spinner
'11110000001', %spinner-button
'11111100001', %picker %'11111100001' used in gda_5
];

%Changing number of available users
count=1000;
for n_classes=10:42
  test_err=[]; 
  for test_set=1:5
  
    button_result = input_cr_val_test('button','gda',button_k,test_set,fs(1,:),n_classes,count);
    checkbox_result = input_cr_val_test('checkbox','gda',checkbox_k,test_set,fs(2,:),n_classes,count);
    radiobutton_result = input_cr_val_test('radiobutton','gda',radiobutton_k,test_set,fs(3,:),n_classes,count);
    %togglebutton_result = input_cr_val_test('togglebutton','gda',togglebutton_k,test_set,fs(4,:),n_classes,count);
    switch_result = input_cr_val_test('switch','gda',switch_k,test_set,fs(5,:),n_classes,count);
    edittext_result = input_cr_val_test('edittext','gda',edittext_k,test_set,fs(6,:),n_classes,count);
    spinner_result = input_cr_val_test('spinner','gda',spinner_k,test_set,fs(7,:),n_classes,count);
    spinner_button_result = input_cr_val_test('spinner-button','gda',spinner_button_k,test_set,fs(8,:),n_classes,count);
    picker_result = input_cr_val_test('picker','gda',picker_k,test_set,fs(9,:),n_classes,count);
   
  
    final_result = [button_result checkbox_result radiobutton_result ...
                      switch_result edittext_result ...
                      spinner_result spinner_button_result picker_result];
     
    emp_err = 0;
    for i=1:size(final_result,1)
      final_result(i,:)=sort(final_result(i,:));
      if mode(final_result(i,:)) ~= i
        emp_err = emp_err + 1;
      end
    end
    test_err=[test_err;emp_err]
  end
  test_all_err=[test_all_err test_err]
end
test_mean_err=mean(test_all_err);

%logging to log file
fileID=fopen('inc_users_gda.log','a');
fprintf(fileID,'test_mean_err=\n');
fprintf(fileID,'%d ',test_mean_err);
fprintf(fileID,'\n');
fclose(fileID);








%
%test_mean_error = ...
%[ ...
%    5.2000    4.0000    3.4000    4.6000    4.2000    4.4000    5.4000    5.8000    5.6000    6.8000    8.2000    8.6000   10.4000   11.4000   13.2000    14.6000   15.8000   18.8000   20.8000   23.8000   24.8000   25.8000   27.6000   29.0000   30.0000   31.0000   31.4000   31.8000   32.0000   32.4000 33.0000   33.0000   33.0000   33.0000 ...
%];
%
%plot((1:maxK),test_mean_err,'b--');
%xlabel('top K predicted classes per candidate classifier');
%ylabel(' Avg. no. of misclassified app usage sessions');

%cr_val_err
%cr_val_emp_err=[cr_val_emp_err;cr_val_err];
%fprintf('cr_val_err = %d\n',sum(cr_val_err)/5);
%cr_val_err_n=[cr_val_err_n;sum(cr_val_err)/5];
