%3NN with 5 apps
a=[     
1     1     0     0     1     1     1     1     2     2     2     3     2     3     3     4     3
0     1     0     0     0     0     0     0     0     0     0     0     0     0     1     0     1
0     0     0     0     0     1     1     1     1     1     1     1     1     1     1     1     1
1     0     0     1     1     1     1     1     1     2     2     3     3     3     2     2     2
0     1     2     1     1     1     1     1     2     1     1     1     1     2     3     3     3
];


b=[     
5     4     6     5     6     7     7     6     8     9    10    13    12    13
2     1     1     1     3     4     6     5     4     6     4     3     5     6
3     4     3     3     3     3     2     3     2     2     2     3     3     4
3     4     4     4     4     5     6     6     5     5     5     6     7     7
2     4     4     4     4     6     7     7     6     5     6     7     7     6
];

knn_3_inc=[a b];
count=4;
knn_3_acc=[];
for i=1:size(knn_3_inc,2)
  acc=(count-mean(knn_3_inc(:,i)))/count;
  knn_3_acc=[knn_3_acc;acc];
  count=count+1;
end

%5NN with 5 apps
a=[
1     1     0     0     1     1     2     1     2     2     2     2     2     2     4     4     4
0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
0     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0
1     0     0     1     1     1     1     2     2     3     3     3     3     3     4     3     3
0     1     2     1     1     1     2     3     3     1     1     1     1     2     3     3     3
];

b=[
5     6     5     6     8     8     9    11    12    11    12    13    14    14
1     3     4     4     4     5     5     4     6     4     5     7     7     6
0     0     1     1     1     0     1     0     1     1     1     1     1     1
4     5     6     6     5     7     6     7     5     6     6     6     6     6
4     5     6     6     6     7     8     8     8     9     9     9     9     8
];

knn_5_inc=[a b];
count=4;
knn_5_acc=[];
for i=1:size(knn_5_inc,2)
  acc=(count-mean(knn_5_inc(:,i)))/count;
  knn_5_acc=[knn_5_acc;acc];
  count=count+1;
end


%GDA with 5 apps
a=[
     1
     2
     0
     0
     0
     2
     2
     0
     1
     0
     2
     1
     0
     0
     0
     1
     1
     1
     1
     0
     1
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     1
     0
     0
     0
     1
     1
     1
     0
     1
     1
     1
     1
     0
     2
     2
     1
     0
     0
     0
     1
     1
     1
     0
     1
     1
     2
     1
     1
     0
     1
     2
     1
     1
     0
     0
     2
     2
     1
     0
     1
     2
     4
     2
     0
     1
     1
     6
     2
     0
     1
     2
     6
     2
     0
     2
     3
     5
     2
     0
     2
     3
     5
     2
     0
     2
     3
     5
     2
     0
     2
     3
     5
     2
     0
     2
     3
     5
     2
     0
     1
     2
     6
     2
     0
     1
     2
     6
     2
     0
     1
     2
     7
     2
     1
     1
     2
     7
     3
     2
     1
     3
     7
     3
     3
     1
     3
];
a=reshape(a,5,31);
gda_inc=[a];
count=4;
gda_acc=[];
for i=1:size(gda_inc,2)
  acc=(count-mean(gda_inc(:,i)))/count;
  gda_acc=[gda_acc;acc];
  count=count+1;
end

%SVM with 5 apps
a=[
     1     2     1     1     0     0     1     0     0     0     0     1     1     0     1     1     1     1
     2     2     2     1     1     0     0     0     0     0     0     1     1     0     0     1     1     1
     0     1     0     0     0     0     0     0     0     0     0     0     0     0     1     1     1     0
     2     1     0     0     0     0     0     1     1     0     0     0     1     1     1     1     1     2
     1     0     0     0     0     0     0     0     0     0     1     1     0     0     0     0     1     2
];
b=[
     2     4     5     5     4     4     4     5     6     5     8     7     6
     1     1     1     1     1     1     1     2     2     2     2     3     4
     0     1     1     1     1     1     1     1     1     1     1     1     1
     2     1     2     2     2     2     2     2     1     1     1     1     1
     1     3     2     1     2     2     3     2     3     3     3     3     3
];
svm_inc=[a b];
count=4;
svm_acc=[];
for i=1:size(svm_inc,2)
  acc=(count-mean(svm_inc(:,i)))/count;
  svm_acc=[svm_acc;acc];
  count=count+1;
end
%End SVM with 5 apps


knn_3_acc=knn_3_acc*100;
knn_5_acc=knn_5_acc*100;
gda_acc=gda_acc*100;
svm_acc=svm_acc*100;


hold on;
axis([4 34  0 100]);
plot((4:34),svm_acc,'k--');
plot((4:34),gda_acc,'r--');
plot((4:34),knn_3_acc,'b--');
plot((4:34),knn_5_acc,'m--');

xlabel('No. of enrolled users');
ylabel('Correctly classified app usage sessions(%)');
legend('SVM','GDA','3NN','5NN');

%h = findobj(gca,'Type','text');
set(gca,'FontSize',15);
