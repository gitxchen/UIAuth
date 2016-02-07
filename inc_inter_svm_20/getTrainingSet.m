function training_set_ret = getTrainingSet(train_sizes,train_data,class,set_count)
  start_set=0;
  end_set=0;
  if class==1
    start_set=1;
    end_set=sum(train_sizes(1:class*set_count,:));
  end
  if class ~= 1
    start_set=sum(train_sizes(1:(class-1)*set_count,:))+1;
    end_set=sum(train_sizes(1:class*set_count,:));
  end
  training_set_ret=train_data(start_set:end_set,:);
end
