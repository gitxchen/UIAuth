%clear;

%Change in accuracy with increasing values of K

n_classes=10;
maxK=n_classes;  

button_k=1;
label_k=2;
bl_k=1;
rlf_k=2;

test_err=[];

%fs from ens_svm_1c_wt
fs=[
'11110000001', %button
'11110000001', %label
'11110000001', %bl
'11110000001', %rlf
];

count=[
5, %button
5, %label
5, %bl
5 %rlf
];
 
%for test_set=1:5

  button_result = input_cr_val_test('button','gda',button_k,fs(1,:),n_classes,count(1,1));
  label_result= input_cr_val_test('label','gda',label_k,fs(2,:),n_classes,count(2,1));
  bl_result = input_cr_val_test('bl','gda',bl_k,fs(3,:),n_classes,count(3,1));
  rlf_result = input_cr_val_test('rlf','gda',rlf_k,fs(4,:),n_classes,count(4,1));
 

  final_result = [button_result label_result bl_result ...
                    rlf_result];
  %final_result=button_result;
    
  emp_err = 0;
  for i=1:size(final_result,1)
    final_result(i,:)=sort(final_result(i,:));
    if mode(final_result(i,:)) ~= i
      emp_err = emp_err + 1;
    end
  end
  test_err=[test_err;emp_err];
%end

mean(test_err)







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
