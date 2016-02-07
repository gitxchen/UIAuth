function result =  input_cr_val_test(input_control,classifier, ...
                                K,test_app,fs,n_classes)
  %input_control='button';
  %classifier='gda';
  %K=3;
  %test_app=5;
  %fs='11110000001';

  %n_classes=34;
  training_apps=[1;2;3;4;5];
  training_apps=training_apps(training_apps~=test_app);
  %training_apps=[2 3 4 5; ...
  %               1 3 4 5; ...
  %               1 2 4 5; ...
  %               1 2 3 5; ...
  %               1 2 3 4;];
  users=(1:n_classes)';
  mu_all=[];
  sigma_all=[];
  for i=1:size(users,1)
    [data,sizes]=loadDataFromFiles(users(i,1),training_apps,input_control,fs);
    mu_all=[mu_all;mean(data)];
    sigma_all=[sigma_all;cov(data)];
  end

  [test_set,test_set_sizes]=loadDataFromFiles(users,[test_app],input_control,fs);
  n_features=size(test_set,2);
  
  if classifier == 'gda'
    result = multiClass_test(mu_all,sigma_all,n_features,n_classes, ...
                             test_set,test_set_sizes,K);
  end
  %if classifier == 'knn'
  %  result = multiClass_knn(training_data,test_data,training_set_size, ...
  %                          test_set_size,n_classes,K);
  %end
end
