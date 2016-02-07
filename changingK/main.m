%clear;

%Change in accuracy with increasing values of K

%Start tweaks
n_classes=42;
log_file='changingK_accuracy.log';
maxK=n_classes;  
%End tweaks

button_k=maxK;
checkbox_k=maxK;
radiobutton_k=maxK;
togglebutton_k=maxK;
switch_k=maxK;
edittext_k=maxK;
spinner_k=maxK;
spinner_button_k=maxK;
picker_k=maxK;
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
'11110000011', %picker %'11111100001' used in gda_5
];

fs(9,:)='11111100001';

%1. GDA
fprintf('Starting changingK experiment for GDA\n');
 
for test_set=1:5

  button_result_all = input_cr_val_test('button','gda',button_k,test_set,fs(1,:),n_classes);
  checkbox_result_all = input_cr_val_test('checkbox','gda',checkbox_k,test_set,fs(2,:),n_classes);
  radiobutton_result_all = input_cr_val_test('radiobutton','gda',radiobutton_k,test_set,fs(3,:),n_classes);
  %togglebutton_result_all = input_cr_val_test('togglebutton','gda',togglebutton_k,test_set,fs(4,:),n_classes);
  switch_result_all = input_cr_val_test('switch','gda',switch_k,test_set,fs(5,:),n_classes);
  edittext_result_all = input_cr_val_test('edittext','gda',edittext_k,test_set,fs(6,:),n_classes);
  spinner_result_all = input_cr_val_test('spinner','gda',spinner_k,test_set,fs(7,:),n_classes);
  spinner_button_result_all = input_cr_val_test('spinner-button','gda',spinner_button_k,test_set,fs(8,:),n_classes);
  picker_result_all = input_cr_val_test('picker','gda',picker_k,test_set,fs(9,:),n_classes);
 
  test_err=[];
  for K=1:maxK
    button_result=button_result_all(:,1:K); 
    checkbox_result=checkbox_result_all(:,1:K); 
    radiobutton_result=radiobutton_result_all(:,1:K); 
    %togglebutton_result=togglebutton_result_all(:,1:K); 
    switch_result=switch_result_all(:,1:K); 
    edittext_result=edittext_result_all(:,1:K); 
    spinner_result=spinner_result_all(:,1:K); 
    spinner_button_result=spinner_button_result_all(:,1:K); 
    picker_result=picker_result_all(:,1:K); 
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
    test_err=[test_err emp_err];
  end
  test_all_err=[test_all_err;test_err];
end

test_mean_err_gda=mean(test_all_err);

%logging to log file
fileID=fopen(log_file,'a');
fprintf(fileID,'test_mean_err_gda =\n');
fprintf(fileID,'%d ',test_mean_err_gda);
fprintf(fileID,'\n');
fclose(fileID);
   



%2. 3NN
test_all_err=[];
fprintf('Starting changingK experiment for 3NN\n');

NumNeighbors=3;
for test_set=1:5
  button_result_all = knn_all('button','knn',button_k,test_set,fs(1,:),NumNeighbors,n_classes);
  checkbox_result_all = knn_all('checkbox','knn',checkbox_k,test_set,fs(2,:),NumNeighbors,n_classes);
  radiobutton_result_all = knn_all('radiobutton','knn',radiobutton_k,test_set,fs(3,:),NumNeighbors,n_classes);
  %togglebutton_result_all = knn_all('togglebutton','knn',togglebutton_k,test_set,fs(4,:),NumNeighbors,n_classes);
  switch_result_all = knn_all('switch','knn',switch_k,test_set,fs(5,:),NumNeighbors,n_classes);
  edittext_result_all = knn_all('edittext','knn',edittext_k,test_set,fs(6,:),NumNeighbors,n_classes);
  spinner_result_all = knn_all('spinner','knn',spinner_k,test_set,fs(7,:),NumNeighbors,n_classes);
  spinner_button_result_all = knn_all('spinner-button','knn',spinner_button_k,test_set,fs(8,:),NumNeighbors,n_classes);
  picker_result_all = knn_all('picker','knn',picker_k,test_set,fs(9,:),NumNeighbors,n_classes);
  
  test_err=[];
  for K=1:maxK
    button_result=button_result_all(:,1:K); 
    checkbox_result=checkbox_result_all(:,1:K); 
    radiobutton_result=radiobutton_result_all(:,1:K); 
    %togglebutton_result=togglebutton_result_all(:,1:K); 
    switch_result=switch_result_all(:,1:K); 
    edittext_result=edittext_result_all(:,1:K); 
    spinner_result=spinner_result_all(:,1:K); 
    spinner_button_result=spinner_button_result_all(:,1:K); 
    picker_result=picker_result_all(:,1:K); 
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
    test_err=[test_err emp_err];
  end
  test_all_err=[test_all_err;test_err];
end

test_mean_err_knn=mean(test_all_err);

%logging to log file
fileID=fopen(log_file,'a');
fprintf(fileID,'test_mean_err_knn =\n');
fprintf(fileID,'%d ',test_mean_err_knn);
fprintf(fileID,'\n');
fclose(fileID);


 
%3. SVM
test_all_err=[];
fprintf('Starting changingK experiment for SVM\n');

for test_set=1:5

  button_result_all = svm_all('button','svm',button_k,test_set,fs(1,:),n_classes);
  checkbox_result_all = svm_all('checkbox','svm',checkbox_k,test_set,fs(2,:),n_classes);
  radiobutton_result_all = svm_all('radiobutton','svm',radiobutton_k,test_set,fs(3,:),n_classes);
  %togglebutton_result_all = svm_all('togglebutton','svm',togglebutton_k,test_set,fs(4,:),n_classes);
  switch_result_all = svm_all('switch','svm',switch_k,test_set,fs(5,:),n_classes);
  edittext_result_all = svm_all('edittext','svm',edittext_k,test_set,fs(6,:),n_classes);
  spinner_result_all = svm_all('spinner','svm',spinner_k,test_set,fs(7,:),n_classes);
  spinner_button_result_all = svm_all('spinner-button','svm',spinner_button_k,test_set,fs(8,:),n_classes);
  picker_result_all = svm_all('picker','svm',picker_k,test_set,fs(9,:),n_classes);
  test_err=[];
  for K=1:maxK
    button_result=button_result_all(:,1:K); 
    checkbox_result=checkbox_result_all(:,1:K); 
    radiobutton_result=radiobutton_result_all(:,1:K); 
    %togglebutton_result=togglebutton_result_all(:,1:K); 
    switch_result=switch_result_all(:,1:K); 
    edittext_result=edittext_result_all(:,1:K); 
    spinner_result=spinner_result_all(:,1:K); 
    spinner_button_result=spinner_button_result_all(:,1:K); 
    picker_result=picker_result_all(:,1:K); 
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
    test_err=[test_err emp_err];
  end
  test_all_err=[test_all_err;test_err];
end

test_mean_err_svm=mean(test_all_err);

%logging to log file
fileID=fopen(log_file,'a');
fprintf(fileID,'test_mean_err_svm =\n');
fprintf(fileID,'%d ',test_mean_err_svm);
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
