function predict_label = predclass_svm(training_set_1,training_set_2,test_data)
  %clear;
  %user1=1;
  %user2=2;
  %training_apps=[3;4];
  %cr_val_no=size(training_apps,1);
  %[training_label_1,sz,training_set_1]=loadSVMDataFromFiles([user1],training_apps,'button','11110000001');
  %[training_label_2,sz,training_set_2]=loadSVMDataFromFiles([user2],training_apps,'button','11110000001');
  %[test_label,sz,test_data]=loadSVMDataFromFiles([user1;user2],[5],'button','11110000001');

  %training_set_1=loadDataFromFiles([user1],training_apps,'button','11110000001');
  %training_set_2=loadDataFromFiles([user2],training_apps,'button','11110000001');
  %test_data=loadDataFromFiles([user1;user2],[5],'button','11110000001');
  %training_set_1=getSVMData(training_set_1,1);
  %training_set_2=getSVMData(training_set_2,2);
  %test_data=getSVMData(test_data,3);
  
  training_label_1=zeros(size(training_set_1,1),1)+1;
  training_label_2=zeros(size(training_set_2,1),1)+2;
  test_pred = zeros(size(test_data,1),2);
  train_data=[training_set_1;training_set_2];
  train_label=[training_label_1;training_label_2];
  cr_val_no=4;
  test_label=zeros(size(test_data,1),1);;
  
  %scaling training & test data
  train_data_size=size(train_data,1);
  test_data_size=size(test_data,1);
  data=[train_data;test_data];
  data=(data - repmat(min(data,[],1),size(data,1),1))* ...
        spdiags(1./(max(data,[],1)-min(data,[],1))', ...
          0,size(data,2),size(data,2));
  train_data=data(1:train_data_size,:);
  test_data=data(train_data_size+1:end,:);


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
  
  cmd = ['-q -c ', num2str(bestc), ' -g ', num2str(bestg)];
  model = svmtrain(train_label,train_data,cmd);
  [predict_label,accuracy,dec_values] = svmpredict(test_label, test_data, model);
  %for i=1:size(test_data,1)
  %  %if predict_label(i,1)==user1
  %  %  predclass=1;
  %  %end
  %  %if predict_label(i,1)==user2
  %  %  predclass=2;
  %  %end
  %  predclass=predict_label(i,1);
  %  test_pred(i,predclass) = test_pred(i,predclass) + 1;
  %end
  %predict_label
  %sum(predict_label(1:11,1)==1)
  %sum(predict_label(12:22,1)==2)
end
