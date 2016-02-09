clear;

log_file='svm_2class_ui.log';

n_classes=9;
max_threshold=10;

fs=[
'11110000001', %button
'11110000001', %label
'11110000001', %bl
'11110000001', %rlf
];

count=[
2, %button
10, %label
2, %bl
10 %rlf
];
 

false_acc_all=[];
false_rej_all=[];

false_acc_mean=[];
false_rej_mean=[];


for threshold=0:max_threshold

  false_acc_all=[];
  false_rej_all=[];
    for user1=1:n_classes
      false_rej=0;
      false_acc=0;

      button_result = pred_two_class_ui_svm(user1,'button',fs(1,:), ...
                                          5,threshold,n_classes);
                                          %threshold,n_classes,count(1,1));
  
      label_result = pred_two_class_ui_svm(user1,'label',fs(2,:), ...
                                            5,threshold,n_classes);
                                            %threshold,n_classes,count(2,1));
  
      bl_result = pred_two_class_ui_svm(user1,'bl',fs(3,:), ...
                                               5,threshold,n_classes);
                                               %threshold,n_classes,count(3,1));
  
      rlf_result = pred_two_class_ui_svm(user1,'rlf',fs(4,:), ...
                                                5,threshold,n_classes);
                                                %threshold,n_classes,count(4,1));
 
      final_result = [button_result label_result bl_result ...
                        rlf_result]


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
                threshold,user1,false_acc,false_rej);
      false_acc_all=[false_acc_all;false_acc]
      fprintf('\n');
      false_rej_all=[false_rej_all;false_rej]
      fprintf('\n\n');

      %logging to log file
      fileID=fopen(log_file,'a');

      fprintf(fileID,'threshold=%d test_set=%d user1=%d false_acc=%d false_rej=%d\n', ...
                threshold,user1,false_acc,false_rej);
      fprintf(fileID,'%d ',false_acc_all);
      fprintf(fileID,'\n');
      fprintf(fileID,'%d ',false_rej_all);
      fprintf(fileID,'\n\n');

      fclose(fileID);
   
    end %end for user1=1:n_classes
  
  
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


