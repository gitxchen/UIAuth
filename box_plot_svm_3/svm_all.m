function result =  svm_all(input_control,classifier, ...
                                K,test_app,fs,n_classes)
  %input_control='button';
  %classifier='gda';
  %K=3;
  %test_app=5;
  %fs='11110000001';

  %n_classes=34;
  training_apps=[3;4;5];
  training_apps=training_apps(training_apps~=test_app);
  %training_apps=[2 3 4 5; ...
  %               1 3 4 5; ...
  %               1 2 4 5; ...
  %               1 2 3 5; ...
  %               1 2 3 4;];
  users=(1:n_classes)';
  train_data=[];
  train_labels=[];
  train_sizes=[];
  
  [train_labels,train_sizes,train_data]=loadSVMDataFromFiles(users, ...
                                                             training_apps, ...
                                                             input_control,fs);

  [test_labels,test_sizes,test_data]=loadSVMDataFromFiles(users, ...
                                                          [test_app], ...
                                                          input_control,fs);
  
  if classifier == 'svm'
    result = multiClass_svm_all(train_sizes,train_data, ...
                            test_sizes,test_data,K);
  end
  %if classifier == 'knn'
  %  result = multiClass_knn(training_data,test_data,training_set_size, ...
  %                          test_set_size,n_classes,K);
  %end
end
