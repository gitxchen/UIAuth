function test_pred = predclass_knn_all(training_set_1,training_set_2,test_set,NumNeighbors)
  %training_set_1=pts1(1:18,:);
  %test_set_1=    pts1(19:27,:);
  %training_set_2=pts2(1:18,:);
  %test_set_2=    pts2(19:27,:);
  %training_set_1(all(training_set_1==0,2),:)=[];
  %training_set_2(all(training_set_2==0,2),:)=[];
  %test_set_1(all(test_set_1==0,2),:)=[];
  %test_set_2(all(test_set_2==0,2),:)=[];

  X=[training_set_1;training_set_2];
  Y1=ones(size(training_set_1,1),1);
  Y2=ones(size(training_set_2,1),1)+1;
  Y=[Y1;Y2];
  mdl=fitcknn(X,Y,'NumNeighbors',NumNeighbors);
  test_pred=predict(mdl,test_set);
  %sum(predict(mdl,test_set_1)==1)
  %sum(predict(mdl,test_set_2)==2) 
  
  %training_set_1(:,2)=[];
  %training_set_2(:,2)=[];
  %test_set_1(:,2)=[];
  %test_set_2(:,2)=[];

  %r1=predclass(training_set_1,training_set_2,test_set_1);
  %r2=predclass(training_set_1,training_set_2,test_set_2);
  
  %r1=predclass(training_set_1(:,1),training_set_2(:,1),test_set_1(:,1));
  %r2=predclass(training_set_1(:,1),training_set_2(:,1),test_set_2(:,1));

  %mu_1 = mean(training_set_1)';
  %mu_2 = mean(training_set_2)';
  %
  %sigma_1=cov(training_set_1);
  %sigma_2=cov(training_set_2);
  %
  %mu_1=mu_1';
  %mu_2=mu_2';
  %
  %M_1 = (-1/2)*pinv(sigma_1);
  %M_2 = (-1/2)*pinv(sigma_2);
  %
  %a_1 = pinv(sigma_1)*mu_1';
  %a_2 = pinv(sigma_2)*mu_2';
  %
  %b_1=(-1/2)*mu_1*pinv(sigma_1)*mu_1' + (-1/2)*log(det(sigma_1));
  %b_2=(-1/2)*mu_2*pinv(sigma_2)*mu_2' + (-1/2)*log(det(sigma_2));
 
  %pred_class = [];
  %true_class = [];
  %test_pred = zeros(size(test_set,1),2);
  %for i=1:size(test_set,1)
  %  x1=test_set(i,:)';
  %  
  %  g_11 = x1'*M_1*x1 + a_1'*x1 + b_1;
  %  g_21 = x1'*M_2*x1 + a_2'*x1 + b_2;
  %
  %  [val,predclass]=max([g_11;g_21]);
  %
  %  %if predclass1~=1
  %  %  emp_err = emp_err + 1;
  %  %end
  %  %if predclass2~=2
  %  %  emp_err = emp_err + 1;
  %  %end
  %  %if predclass3~=3
  %  %  emp_err = emp_err + 1;
  %  %end
  %  %pred_class=[pred_class;predclass1;predclass2];
  %  %true_class=[true_class;1;2];
  %  
  %  test_pred(i,predclass) = test_pred(i,predclass) + 1;
  %end
  %cmat=confusionmat(true_class,pred_class);
end
