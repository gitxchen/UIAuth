clear;

log_file='ens_svm_1c_wt.log';

n_classes=42;
max_threshold=40;


false_acc_all=[];
false_rej_all=[];
false_acc_mean=[];
false_rej_mean=[];


%for threshold=0:0
for threshold=37:max_threshold

  for test_set=1:5
  
    for user1=1:n_classes
      false_rej=0;
      false_acc=0;
      button_result = pred_1class_svm(user1,'button','11110000001', ...
                                          test_set,threshold,n_classes);
  
      checkbox_result = pred_1class_svm(user1,'checkbox','11110000001', ...
                                            test_set,threshold,n_classes);
  
      radiobutton_result = pred_1class_svm(user1,'radiobutton','11100000001', ...
                                               test_set,threshold,n_classes);
  
      togglebutton_result = pred_1class_svm(user1,'togglebutton','11100000001', ...
                                                test_set,threshold,n_classes);
  
      switch_result = pred_1class_svm(user1,'switch','11110100001', ...
                                          test_set,threshold,n_classes);
  
      edittext_result = pred_1class_svm(user1,'edittext','10100000001', ...
                                            test_set,threshold,n_classes);
      
      spinner_result = pred_1class_svm(user1,'spinner','10100000001', ...
                                           test_set,threshold,n_classes);
   
      spinner_button_result = pred_1class_svm(user1,'spinner-button', ...
                                                  '11110000001', ...
                                                  test_set,threshold,n_classes);
      
      picker_result = pred_1class_svm(user1,'picker','11110000011', ...
                                          test_set,threshold,n_classes); 
  %fs='11110000011'; %fs for picker
  %fs='11110100001'; %fs for switch
      %final_result = picker_result;
      final_result = [button_result checkbox_result radiobutton_result ...
                    togglebutton_result switch_result edittext_result spinner_result ...
                    spinner_button_result picker_result];
     
    
      %Prediction for true class
      pred_class=mode(final_result(1,:));
      if pred_class ~= 1
        false_rej=false_rej+1;
      end
      
      %Prediction for imposters
      for i=2:size(final_result,1)
        if mode(final_result(i,:)) ~= -1
          false_acc = false_acc + 1;
        end
      end
  
      %logging to std. output
      fprintf('threshold=%d test_set=%d user1=%d false_acc=%d false_rej=%d\n', ...
                threshold,test_set,user1,false_acc,false_rej);
      false_acc_all=[false_acc_all;false_acc]
      fprintf('\n');
      false_rej_all=[false_rej_all;false_rej]
      fprintf('\n\n');

      %logging to log file
      fileID=fopen(log_file,'a');

      fprintf(fileID,'threshold=%d test_set=%d user1=%d false_acc=%d false_rej=%d\n', ...
                threshold,test_set,user1,false_acc,false_rej);
      fprintf(fileID,'%d ',false_acc_all);
      fprintf(fileID,'\n');
      fprintf(fileID,'%d ',false_rej_all);
      fprintf(fileID,'\n\n');

      fclose(fileID);
   
    end %end for user1=1:n_classes
  
  
  end %end for test_set=1:5
  false_acc_mean=[false_acc_mean;mean(false_acc_all)];
  false_rej_mean=[false_rej_mean;mean(false_rej_all)];
  false_acc_all=[];
  false_rej_all=[];

  fileID=fopen(log_file,'a');

  fprintf(fileID,'threshold=%d\n',threshold); 
  fprintf(fileID,'false_acc_mean = \n');
  fprintf(fileID,'%f ',false_acc_mean);
  fprintf(fileID,'\n');
  
  fprintf(fileID,'false_rej_mean = \n');
  fprintf(fileID,'%f ',false_rej_mean);
  fprintf(fileID,'\n');
  
  
  fclose(fileID);
end %end for threshold=1:max_threshold


