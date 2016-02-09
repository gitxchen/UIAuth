%3NN with 5 apps
  %Values for user counts from 4 through 42
test_mean_err_knn= ...
[ ...
0 0 0 3 4 5 6 7 7.400000e+00 6.600000e+00 4.200000e+00 3.200000e+00 2.800000e+00 2 2.600000e+00 1.800000e+00 1.800000e+00 2 2 2.200000e+00 2.600000e+00 3.400000e+00 2.800000e+00 2.800000e+00 3.200000e+00 3.800000e+00 3.800000e+00 4.400000e+00 5 4.800000e+00 5.200000e+00 5.200000e+00 5.800000e+00 5.800000e+00 5.800000e+00 6.600000e+00 6.800000e+00 6.400000e+00 7 7.400000e+00 7.600000e+00 8 ...
];

count=1;
knn_acc=[];
for i=1:size(test_mean_err_knn,2)
  acc=(count-test_mean_err_knn(1,i))/count;
  knn_acc=[knn_acc;acc];
  count=count+1;
end


%GDA with 5 apps
  %Values for user counts from 4 through 42
test_mean_err_gda= ...
[ ...
0 0 0 3 2.400000e+00 2 1.200000e+00 8.000000e-01 8.000000e-01 8.000000e-01 4.000000e-01 1 8.000000e-01 6.000000e-01 8.000000e-01 1 1.200000e+00 8.000000e-01 8.000000e-01 1.600000e+00 1.400000e+00 1.800000e+00 2.600000e+00 2.800000e+00 3 3.400000e+00 3.400000e+00 3.200000e+00 2.800000e+00 2.800000e+00 3.400000e+00 3.600000e+00 4.600000e+00 5 5.200000e+00 4.800000e+00 5 4.200000e+00 4.800000e+00 5.200000e+00 5.200000e+00 5.200000e+00 ...
];

count=1;
gda_acc=[];
for i=1:size(test_mean_err_gda,2)
  acc=(count-test_mean_err_gda(1,i))/count;
  gda_acc=[gda_acc;acc];
  count=count+1;
end




%SVM with 5 apps
  %Values only for user counts from 8 through 32
  % picked up from inc_users_svm.log and inc_users_svm_1.log

test_err_svm= ...
[ ...
0 0 0 0 0 %Added on Jan 26, 2016
0 0 0 0 0 %Added on Jan 26, 2016
0 0 0 0 0 %Added on Jan 26, 2016
0 0 0 0 0 %Added on Jan 26, 2016
0 0 0 0 0 %Added on Jan 26, 2016
0 0 0 0 0 %Added on Jan 26, 2016
0 0 0 0 0 %Added on Jan 26, 2016
1 2 0 1 1 %Added on Jan 26, 2016
1 1 1 1 1 %Added on Jan 26, 2016
1 1 1 1 1 
0 2 0 1 0 
1 1 0 2 0 
2 1 0 3 0 
1 1 0 2 0 
2 0 0 1 0 
2 0 0 1 0 
2 0 0 1 0 
1 1 1 1 0 
1 2 1 1 0 
1 2 1 1 2 
1 2 0 1 0 
1 2 0 1 2 
3 2 1 1 1 
4 2 1 1 2 
4 2 1 1 2 
4 2 1 1 3 
4 2 1 1 3 
3 1 1 1 2 
4 1 2 1 2 
5 3 1 1 2 
5 3 1 2 2 
8 2 1 3 2 

];

test_mean_err_svm=mean(test_err_svm');
count=1;
svm_acc=[];
for i=1:size(test_mean_err_svm,2)
  acc=(count-test_mean_err_svm(1,i))/count;
  svm_acc=[svm_acc;acc];
  count=count+1;
end

%End SVM with 5 apps


knn_acc=knn_acc*100;
gda_acc=gda_acc*100;
svm_acc=svm_acc*100;


hold on;
axis([8 32  0 100]);
%plot((4:42),svm_acc,'k--');
plot((8:32),svm_acc(8:32,:),'g-');
plot((8:32),gda_acc(8:32,:),'r--');
plot((8:32),knn_acc(8:32,:),'b-.');


%xlabel('No. of enrolled users');
%ylabel('Correctly classified app usage sessions(%)');

h_legend=legend('SVM','GDA','3NN');
toplot_legend('# Enrolled Users','Session Classification Accuracy(%)','',h_legend);

%h = findobj(gca,'Type','text');
set(gca,'FontSize',15);

print -depsc '/export/scratch/vaibhav/MoST_paper/figures/inc_users_42_3'
