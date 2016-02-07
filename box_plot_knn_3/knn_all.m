function result =  knn_all(input_control,classifier, ...
                                K,test_app,fs,NumNeighbors,n_classes)
  %input_control='button';
  %classifier='gda';
  %K=3;
  %test_app=5;
  %fs='11110000001';

  %n_classes=34;
  training_apps=[3;4;5];
  training_apps=training_apps(training_apps~=test_app);
  users=(1:n_classes)';
  train_data=[];
  train_sizes=[];
  
  [train_data,train_sizes]=loadDataFromFiles(users, ...
                                             training_apps, ...
                                             input_control,fs);

  [test_data,test_sizes]=loadDataFromFiles(users, ...
                                           [test_app], ...
                                           input_control,fs);
  
  if classifier == 'knn'
    result = multiClass_knn_all(train_sizes,train_data, ...
                            test_sizes,test_data,K,NumNeighbors);
  end

end
