function result =  input_cr_val_test(input_control,classifier, ...
                                K,fs,n_classes,count)
  %input_control='button';
  %classifier='gda';
  %K=3;
  %test_app=5;
  %fs='11110000001';

  %n_classes=34;
  %training_apps=[2 3 4 5; ...
  %               1 3 4 5; ...
  %               1 2 4 5; ...
  %               1 2 3 5; ...
  %               1 2 3 4;];
  users=(1:n_classes)';
  mu_all=[];
  sigma_all=[];
  test_set=[];
  test_set_sizes=[];
  for i=1:size(users,1)
    [data,sizes]=loadDataFromFiles(users(i,1),input_control,fs);
    
    train_set=data(1:(sizes-count),:);
    mu_all=[mu_all;mean(train_set)];
    sigma_all=[sigma_all;cov(train_set)];
    
    test_set=[test_set;data(sizes-count+1:end,:)];
    test_set_sizes=[test_set_sizes;count];
  end

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
