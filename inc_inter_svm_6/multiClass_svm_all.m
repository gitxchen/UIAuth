function topKResult = multiClass_svm_all(train_sizes,train_data, ...
                                     test_sizes,test_data,K),
  classifier_count=0;
  training_set_1=[];
  training_set_2=[];
  predictions=[];
  test_size=size(test_data,1);
  n_classes=size(test_sizes,1);
  votes=zeros(test_size,(n_classes*(n_classes-1))/2);
  topKResult = [];

  for i=1:n_classes
    training_set_1=getTrainingSet(train_sizes,train_data,i,4);
    for j=i+1:n_classes
      %fprintf('Comparing %d & %d\n',i,j);
      training_set_2=getTrainingSet(train_sizes,train_data,j,4);
      classifier_count = classifier_count+1;
      predictions = predclass_svm_all(training_set_1,training_set_2,test_data);
      for k=1:test_size
        if predictions(k,1) == 1 
          votes(k,classifier_count)=i;
        end
        if predictions(k,1) == 2
          votes(k,classifier_count)=j;
        end
      end
    end
  end 
  
  confusion_mat=zeros(n_classes,n_classes);
  pred_class_vec=[];
  output = zeros(n_classes,1);
  all_tmp = [];
  for i=1:n_classes
    [test_set_start,test_set_end]=findTestSet(test_sizes,i);
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
  
  accuracy=zeros(n_classes,1);
  sum_all = [];
  
  for i=1:n_classes
    sum_vec=[];
    [test_set_start,test_set_end]=findTestSet(test_sizes,i);
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
end 
