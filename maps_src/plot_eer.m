hold on;

n_classes=10;

plot1_style='c.';
plot2_style='r-';
plot3_style='g-';
plot4_style='b-';
line_style='k--';


plot1_label='1 class SVM without togglebutton';
plot2_label='1 class SVM';
plot3_label='SVDD';
plot4_label='2 class SVM';


acc_1=[
0.222222 0.555556 1.333333 1.666667 2.000000 2.111111 2.444444 2.666667 2.777778 2.777778 2.777778 
];

rej_1=[
1.000000 0.777778 0.222222 0.111111 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
];


%Plot to see ROC
%semilogx((acc_1/33)*100,(1-rej_1)*100,'r--');
%plot((acc_1/33)*100,(1-rej_1)*100,'r--');

x_acc=(1:size(acc_1,2));
x_rej=(1:size(rej_1,2));
[ax,p1,p2]=plotyy(x_acc,(acc_1/(n_classes-1))*100,x_rej,rej_1*100);
p1.LineStyle='--';
p1.Color='r';
p2.LineStyle='--';
p2.Color='r';
ax(1).YColor='k';
ax(2).YColor='k';
set(ax(1),'ylim',[0 101]);
set(ax(2),'ylim',[0 101]);
ax(1).YTick=0:3:100;
ax(2).YTick=0:3:100;
set(get(ax(1),'Ylabel'),'String','Avg. False Acceptance Rate(%)') 
set(get(ax(2),'Ylabel'),'String','Avg. False Rejection Rate(%)') 
  








hold off;
