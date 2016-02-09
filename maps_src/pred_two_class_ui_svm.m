function ret_pred_labels=pred_two_class_ui_svm(user1,input_control,fs, ...
                                     test_app_no,threshold,n_classes)
  %clear;
 
  %Tweaks start
  %user1=1; %legimitate user
  %input_control='button';
  %fs='11110000001';
  %test_app_no=5;
  %threshold=1;
  %n_classes=33;
  %Tweaks end
  
  ret_pred_labels=[];
  users=(1:n_classes)';
  all_imposters=users(users~=user1);
  all_imposters=reshape(all_imposters,4,floor(n_classes/4));
  
  apps=[1;2;3;4;5];
  training_apps=apps(apps~=test_app_no);
  

  cr_val_no=size(training_apps,1);
  
  [a,b,train_data_orig]=loadSVMDataFromFiles([user1],training_apps, ...
                                  input_control,fs);
  all_pred_labels=zeros(n_classes,1);

  for imposter_col=1:size(all_imposters,2)
    pred_labels=[];
    imposters_known=all_imposters(:,imposter_col);
    train_data_imposter=[];
    for i=1:size(training_apps,1)
      [tmp_label,tmp_size,tmp_data]=loadSVMDataFromFiles(imposters_known(i,1), ...
                                                     training_apps(i,1), ...
                                                     input_control,fs);
      train_data_imposter=[train_data_imposter;tmp_data];
    end

    
    train_label_orig=zeros(size(train_data_orig,1),1)+1;
    train_label_imposter=zeros(size(train_data_imposter,1),1)-1;

    train_data=[train_data_orig;train_data_imposter];
    train_label=[train_label_orig;train_label_imposter];
    train_data_size=size(train_data,1);
    
    %Loading test data for legitimate user and unknown imposters
    imposters_unknown=users;
    for index=1:size(imposters_known,1)
      imposters_unknown = imposters_unknown(imposters_unknown~=imposters_known(index,1));
    end
    [a,test_sizes,test_data]=loadSVMDataFromFiles([user1;imposters_unknown],test_app_no, ...
                                  input_control,fs);
    test_orig_label=zeros(test_sizes(1,1),1)+1;
    test_imposter_label=zeros(sum(test_sizes(2:end,1)),1)-1;
    test_label=[test_orig_label;test_imposter_label];
    
    
    %Scaling start
    data=[train_data;test_data];
        
    data=(data - repmat(min(data,[],1),size(data,1),1))* ...
      spdiags(1./(max(data,[],1)-min(data,[],1))', ...
        0,size(data,2),size(data,2));
    
    train_data=data(1:train_data_size,:);
    test_data=data(train_data_size+1:end,:);
    %Scaling end
    
    %Cross-validation start
    bestcv = 0;
    bestc=-5;
    bestg=-5;
    for log2c = -4:12,
      for log2g = -9:4,
        cmd = ['-q -v ',num2str(cr_val_no),' -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
        cv = svmtrain(train_label, train_data, cmd);
        if (cv >= bestcv),
          bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
        end
        %fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
      end
    end
    
    %fprintf('**(best c=%g, g=%g, rate=%g)\n', bestc, bestg, bestcv);
    %Cross-validation end
    
    cmd = ['-q -c ', num2str(bestc), ' -g ', num2str(bestg)];
    model = svmtrain(train_label,train_data,cmd);
    [predict_label,accuracy,dec_values] = svmpredict(test_label, test_data, model);

    %Adjust threshold
    if threshold>size(test_orig_label,1)-1
      threshold=size(test_orig_label,1)-1;
    end
    K=size(test_orig_label,1)-threshold;

    for ind=1:size(imposters_unknown,1)
      class=imposters_unknown(ind,1);
      [start_ind,end_ind]=getSessionForClass(test_sizes,ind);
      class_predict_label=predict_label(start_ind:end_ind,1);
      score=sum(class_predict_label==1);
      if score < K
        predicted_class=-1;
      else
        predicted_class=1;
      end
      all_pred_labels(class,1)= ...
        all_pred_labels(class,1)+predicted_class;
    end %end for
    
  end %for imposter_col=1:size(all_imposters,2)
  
  for i=1:size(all_pred_labels)
    if(all_pred_labels(i,1)>0)
      ret_pred_labels=[ret_pred_labels;1];
    else
      ret_pred_labels=[ret_pred_labels;-1];
    end
  end
  %ret_pred_labels
end
