function ret_pred_labels=pred_two_class_svm(user1,input_control,fs, ...
                                     threshold,n_classes,count)
 
  %clear;
  %Tweaks start
  %user1=1; %legimitate user
  %input_control='button';
  %fs='11110000001';
  %threshold=1;
  %n_classes=3;
  %count=5;
  %Tweaks end
  
  ret_pred_labels=[];
  users=(1:n_classes)';
  all_imposters=users(users~=user1);
  
  cr_val_no=2;
  
  [a,orig_size,orig_data]=loadSVMDataFromFiles([user1], ...
                                  input_control,fs);
  
  train_data_orig=[orig_data(1:orig_size-count,:)];
  train_data_imposter=[];

  test_data=[orig_data(orig_size-count+1:end,:)];
  test_orig_label=zeros(count,1)+1;
  test_sizes=[count];
  
  for i=1:size(all_imposters,1)
    [a,imposter_size,imposter_data]= ...
      loadSVMDataFromFiles([all_imposters(i,1)], ...
                           input_control,fs);
    train_data_imposter=[train_data_imposter;imposter_data(1:imposter_size-count,:)];
    test_data=[test_data;imposter_data(imposter_size-count+1:end,:)];
    test_sizes=[test_sizes;count];
    
  end

 
  all_pred_labels=[];

  test_orig_label=zeros(test_sizes(1,1),1)+1;
  test_imposter_label=zeros(sum(test_sizes(2:end,1)),1)-1;
  test_label=[test_orig_label;test_imposter_label];

  pred_labels=[];

    
  train_label_orig=zeros(size(train_data_orig,1),1)+1;
  train_label_imposter=zeros(size(train_data_imposter,1),1)-1;

  train_data=[train_data_orig;train_data_imposter];
  train_label=[train_label_orig;train_label_imposter];
  train_data_size=size(train_data,1);
    
    
    
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

  %predict_label
  %sum(predict_label(1:11,:)==1)
  %sum(predict_label(12:22,:)==-1)
  
  %Adjust threshold
  if threshold>size(test_orig_label,1)-1
    threshold=size(test_orig_label,1)-1;
  end
  K=size(test_orig_label,1)-threshold;

  %false_acc=0;
  %false_rej=0;

  for class=1:n_classes
    [start_ind,end_ind]=getSessionForClass(test_sizes,class);
    class_predict_label=predict_label(start_ind:end_ind,1);
      %class_true_label=test_label(start_ind:end_ind,1);
      %if sum(class_true_label==1)==size(class_true_label,1)
      %  %this session usage belongs to true owner
      %  score=sum(class_predict_label==1);
      %  if score < K
      %    %true owner will be rejected
      %    false_rej=false_rej+1;
      %  end
      %else
      %  %this session usage belongs to imposter
      %  score=sum(class_predict_label==-1);
      %  if score >=K
      %    %an imposter will be accepted
      %    false_acc=false_acc+1;
      %  end
      %end 
    score=sum(class_predict_label==1);
    if score < K
      predicted_class=-1;
    else
      predicted_class=1;
    end
    pred_labels=[pred_labels;predicted_class];
  end %end for

  all_pred_labels=[all_pred_labels pred_labels];
  
  ret_pred_labels=all_pred_labels;
end
