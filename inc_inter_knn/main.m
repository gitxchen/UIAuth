%clear;
button_k=7;
checkbox_k=7;
radiobutton_k=7;
togglebutton_k=7;
switch_k=7;
edittext_k=7;
spinner_k=7;
spinner_button_k=7;
picker_k=7;
test_err=[];

NumNeighbors=3;
test_err=[];
n_classes=42;

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

test_all_err=[];

for count=1:35
  test_err=[];
  for test_set=5:5
    button_result = knn_all('button','knn',button_k,test_set,fs(1,:),NumNeighbors,n_classes,count);
    checkbox_result = knn_all('checkbox','knn',checkbox_k,test_set,fs(2,:),NumNeighbors,n_classes,count);
    radiobutton_result = knn_all('radiobutton','knn',radiobutton_k,test_set,fs(3,:),NumNeighbors,n_classes,count);
    %togglebutton_result = knn_all('togglebutton','knn',togglebutton_k,test_set,fs(4,:),NumNeighbors,n_classes,count);
    switch_result = knn_all('switch','knn',switch_k,test_set,fs(5,:),NumNeighbors,n_classes,count);
    edittext_result = knn_all('edittext','knn',edittext_k,test_set,fs(6,:),NumNeighbors,n_classes,count);
    spinner_result = knn_all('spinner','knn',spinner_k,test_set,fs(7,:),NumNeighbors,n_classes,count);
    spinner_button_result = knn_all('spinner-button','knn',spinner_button_k,test_set,fs(8,:),NumNeighbors,n_classes,count);
    picker_result = knn_all('picker','knn',picker_k,test_set,fs(9,:),NumNeighbors,n_classes,count);
    
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
  test_all_err=[test_all_err test_err];


end

test_mean_err=test_all_err;
%test_mean_err=mean(test_all_err);

%logging to log file
fileID=fopen('new_inc_inter_knn.log','a');
fprintf(fileID,'test_mean_err=\n');
fprintf(fileID,'%d ',test_mean_err);
fprintf(fileID,'\n');
fclose(fileID);

