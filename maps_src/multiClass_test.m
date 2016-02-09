function topKResult = multiClass_test(training_mu,training_sigma, ...
                                      n_features,n_classes, ...
                                      test_data,test_set_sizes,K)
  classifier_count=0;
  training_mu_1=[];
  training_mu_2=[];
  training_sigma_1=[];
  training_sigma_2=[];
  predictions=[];
  votes=zeros(size(test_data,1),(n_classes*(n_classes-1))/2);
  topKResult = [];

  for i=1:n_classes
    training_mu_1=training_mu(i,:);
    training_sigma_1=training_sigma((i-1)*n_features+1:i*n_features,:);
    for j=i+1:n_classes
      %fprintf('Comparing %d & %d\n',i,j);
      training_mu_2=training_mu(j,:);
      training_sigma_2=training_sigma((j-1)*n_features+1:j*n_features,:);
      classifier_count = classifier_count+1;
      predictions = predclass_test(training_mu_1,training_sigma_1, ...
                              training_mu_2,training_sigma_2, ...
                              test_data);
      
      emp_err1=0;
      emp_err2=0;
      for k=1:size(test_data,1)
        if predictions(k,1) == 1 
          votes(k,classifier_count)=i;
        end
        if predictions(k,2) == 1
          votes(k,classifier_count)=j;
        end
      end
      %fprintf('emp_err1 = %d emp_err2 = %d\n',emp_err1,emp_err2);
    end
  end 
  
  confusion_mat=zeros(n_classes,n_classes);
  pred_class_vec=[];
  output = zeros(n_classes,1);
  all_tmp = [];
  for i=1:n_classes
    [test_set_start,test_set_end]=findTestSet(test_set_sizes,i);
    test_set_size=test_set_end-test_set_start+1;
    votes_i=votes(test_set_start:test_set_end,:);
    for k=1:test_set_size
      tmp=[];
      for n=1:n_classes
        tmp=[tmp sum(votes_i(k,:)==n)];
      end
      all_tmp=[all_tmp;tmp];
    end
  end
  %all_tmp_1=[];
  accuracy=zeros(n_classes,1);
  %for i=1:size(all_tmp)
  %  [del,sortedIndices]=sort(all_tmp(i,:),'descend');
  %  topK=sortedIndices(1:K);
  %  all_tmp_1=[all_tmp_1;topK];
  %  if sum(topK==(floor(i/test_set_size)+1)) ~= 0
  %    accuracy(floor(i/test_set_size)+1,1) = ...
  %      accuracy(floor(i/test_set_size)+1,1) + 1;
  %  end
  %end
  %sum(accuracy)/size(accuracy,1);

  sum_all = [];
  for i=1:n_classes
    sum_vec=[];
    [test_set_start,test_set_end]=findTestSet(test_set_sizes,i);
    test_set_size=test_set_end-test_set_start+1;
    if test_set_size ~= 1
      sum_vec  = sum(all_tmp(test_set_start:test_set_end,:));
    else
      sum_vec = all_tmp(i,:);
    end
    sum_all=[sum_all ; sum_vec];
  end
  
  final_result = [];
  for i=1:n_classes
    [del,sortedIndices]=sort(sum_all(i,:),'descend');
    top_sumK = sortedIndices(:,1:K);
    final_result = [final_result ; top_sumK];
    if sum(top_sumK==i) ~= 0
      accuracy(i,1) = accuracy(i,1) + 1;
    end
  end
  topKResult = final_result;
  fprintf('Accuracy = %d/%d\n',sum(accuracy),n_classes);
  %test_data
  %test_set_sizes
  %votes
end
