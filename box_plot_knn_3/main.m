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
cr_val_err=[];
test_set=1;
cr_val_err_n=[];
cr_val_emp_err=[];

NumNeighbors=3;
cr_val_err=[];
n_classes=42;
%for test_set=1:5
true_class=[];
pred_class=[];
test_set=5;

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

for test_set=1:5
  button_result = knn_all('button','knn',button_k,test_set,fs(1,:),NumNeighbors,n_classes);
  checkbox_result = knn_all('checkbox','knn',checkbox_k,test_set,fs(2,:),NumNeighbors,n_classes);
  radiobutton_result = knn_all('radiobutton','knn',radiobutton_k,test_set,fs(3,:),NumNeighbors,n_classes);
  %togglebutton_result = knn_all('togglebutton','knn',togglebutton_k,test_set,fs(4,:),NumNeighbors,n_classes);
  switch_result = knn_all('switch','knn',switch_k,test_set,fs(5,:),NumNeighbors,n_classes);
  edittext_result = knn_all('edittext','knn',edittext_k,test_set,fs(6,:),NumNeighbors,n_classes);
  spinner_result = knn_all('spinner','knn',spinner_k,test_set,fs(7,:),NumNeighbors,n_classes);
  spinner_button_result = knn_all('spinner-button','knn',spinner_button_k,test_set,fs(8,:),NumNeighbors,n_classes);
  picker_result = knn_all('picker','knn',picker_k,test_set,fs(9,:),NumNeighbors,n_classes);
  
  final_result = [button_result checkbox_result radiobutton_result ...
                  switch_result edittext_result ...
                  spinner_result spinner_button_result picker_result];
  
  emp_err = 0;
  for i=1:size(final_result,1)
    final_result(i,:)=sort(final_result(i,:));
    if mode(final_result(i,:)) ~= i
      emp_err = emp_err + 1;
    end
    pred_class=[pred_class;mode(final_result(i,:));];
    true_class=[true_class;i];
  end
  cr_val_err=[cr_val_err;emp_err];
end
%cr_val_err
%cr_val_emp_err=[cr_val_emp_err cr_val_err];
%fprintf('cr_val_err = %d\n',sum(cr_val_err)/5);
%cr_val_err_n=[cr_val_err_n;sum(cr_val_err)/5];
