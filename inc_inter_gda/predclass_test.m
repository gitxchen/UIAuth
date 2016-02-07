function test_pred = predclass_test(mu_1,sigma_1, ...
                                    mu_2,sigma_2, ...
                                    test_set)
  
  M_1 = (-1/2)*pinv(sigma_1);
  M_2 = (-1/2)*pinv(sigma_2);
  
  a_1 = pinv(sigma_1)*mu_1';
  a_2 = pinv(sigma_2)*mu_2';
  
  b_1=(-1/2)*mu_1*pinv(sigma_1)*mu_1' + (-1/2)*log(det(sigma_1));
  b_2=(-1/2)*mu_2*pinv(sigma_2)*mu_2' + (-1/2)*log(det(sigma_2));
 
  pred_class = [];
  true_class = [];
  test_pred = zeros(size(test_set,1),2);
  for i=1:size(test_set,1)
    x1=test_set(i,:)';
    
    g_11 = x1'*M_1*x1 + a_1'*x1 + b_1;
    g_21 = x1'*M_2*x1 + a_2'*x1 + b_2;
  
    [val,predclass]=max([g_11;g_21]);
  
    %if predclass1~=1
    %  emp_err = emp_err + 1;
    %end
    %if predclass2~=2
    %  emp_err = emp_err + 1;
    %end
    %if predclass3~=3
    %  emp_err = emp_err + 1;
    %end
    %pred_class=[pred_class;predclass1;predclass2];
    %true_class=[true_class;1;2];
    
    test_pred(i,predclass) = test_pred(i,predclass) + 1;
  end
  %cmat=confusionmat(true_class,pred_class);
end
