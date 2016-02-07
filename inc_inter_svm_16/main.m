clear;
button_k=4;
checkbox_k=4;
radiobutton_k=4;
togglebutton_k=4;
switch_k=4;
edittext_k=4;
spinner_k=4;
spinner_button_k=4;
picker_k=4;

log_file='inc_inter_svm_5_new.log';

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

n_classes=42;
test_all_err=[];

for count=16:16
  test_err=[];
  for test_set=5:5
    
    button_result = svm_all('button','svm',button_k,test_set,fs(1,:),n_classes,count);
    checkbox_result = svm_all('checkbox','svm',checkbox_k,test_set,fs(2,:),n_classes,count);
    radiobutton_result = svm_all('radiobutton','svm',radiobutton_k,test_set,fs(3,:),n_classes,count);
    %togglebutton_result = svm_all('togglebutton','svm',togglebutton_k,test_set,fs(4,:),n_classes,count);
    switch_result = svm_all('switch','svm',switch_k,test_set,fs(5,:),n_classes,count);
    edittext_result = svm_all('edittext','svm',edittext_k,test_set,fs(6,:),n_classes,count);
    spinner_result = svm_all('spinner','svm',spinner_k,test_set,fs(7,:),n_classes,count);
    spinner_button_result = svm_all('spinner-button','svm',spinner_button_k,test_set,fs(8,:),n_classes,count);
    picker_result = svm_all('picker','svm',picker_k,test_set,fs(9,:),n_classes,count);
    
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
    test_err=[test_err;emp_err];
    
  end

  %logging to log file
  fileID=fopen(log_file,'a');
  fprintf(fileID,'no of interactions = %d\n', count);
  fprintf(fileID,'test_err=\n');
  fprintf(fileID,'%d ',test_err);
  fprintf(fileID,'\n');
  fclose(fileID);

  test_all_err=[test_all_err test_err];
end
test_mean_err=mean(test_all_err);

%logging to log file
fileID=fopen(log_file,'a');
fprintf(fileID,'test_mean_err=\n');
fprintf(fileID,'%d ',test_mean_err);
fprintf(fileID,'\n');
fclose(fileID);

