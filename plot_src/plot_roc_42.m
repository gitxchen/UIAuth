hold on;

n_classes=42;

plot1_style='r-';
plot2_style='g-';
plot3_style='b-';
plot4_style='c-';
line_style='k--';


plot1_label='1 class SVM';
plot2_label='SVDD';
plot3_label='2 class SVM';
plot4_label='';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Mean FAR in acc_1, FRR in rej_1 for 1 class SVM with RBF kernel 
%    with togglebutton for 42 users with false_acc_1_all and false_rej_1_all
%    cleared off for every new threshold value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

acc_1=[
0.752381 4.152381 10.000000 16.290476 21.452381 25.509524 28.638095 31.161905 33.252381 34.985714 36.285714 37.190476 37.966667 38.580952 39.095238 39.480952 39.666667 39.876190 40.123810 40.280952 40.347619 40.380952 40.419048 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810 40.423810
];

rej_1=[
0.904762 0.314286 0.066667 0.009524 0.004762 0.004762 0.004762 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0 0
];

x_acc=(1:size(acc_1,2));
x_rej=(1:size(rej_1,2));

%Plot to see EER
%plot(x_acc,(acc/33)*100,'b--',x_rej,rej*100,'b--');

%Plot to see ROC
%semilogx((acc/33)*100,(1-rej)*100,'b--');
plot((acc_1/(n_classes-1))*100,(1-rej_1)*100,plot1_style,'Linewidth',2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Mean FAR in acc_2, FRR in rej_2 for SVDD  
%    with togglebutton for 42 users with false_acc_2_all and false_rej_2_all
%    cleared off for every new threshold value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

acc_2 = [ 
1.004762 2.833333 4.980952 7.633333 8.780952 11.100000 12.080952 13.742857 16.204762 17.890476 22.014286 22.904762 24.857143 27.123810 29.395238 31.538095 31.757143 32.661905 33.542857 34.561905 35.566667 36.428571 36.828571 36.709524 36.347619 36.828571 36.804762 37.095238 37.261905 36.300000 36.276190 36.400000 36.600000 36.623810 36.757143 36.071429 36.457143 36.180952 36.623810 36.509524 36.495238
];
 
rej_2=[
0.904762 0.757143 0.595238 0.542857 0.504762 0.461905 0.404762 0.366667 0.280952 0.223810 0.133333 0.119048 0.080952 0.066667 0.028571 0.019048 0.028571 0.009524 0.019048 0.004762 0.004762 0.000000 0.000000 0.004762 0.004762 0.004762 0.014286 0.004762 0.004762 0.014286 0.009524 0.014286 0.014286 0.009524 0.000000 0.014286 0.004762 0.004762 0.014286 0.009524 0.014286 
];

x_acc_2=(1:size(acc_2,2));
x_rej_2=(1:size(rej_2,2));

%Plot to see EER
%plot(x_acc_2,(acc_2/33)*100,'b--',x_rej_2,rej_2*100,'b--');

%Plot to see ROC
%semilogx((acc_2/33)*100,(1-rej_2)*100,'b--');
plot((acc_2/(n_classes-1))*100,(1-rej_2)*100,plot2_style,'Linewidth',2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Mean FAR in acc_3, FRR in rej_3 for 2 class SVM with RBF kernel 
%    with togglebutton for 42 users with false_acc_3_all and false_rej_3_all
%    cleared off for every new threshold value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

acc_3 = [ 
0.107317 0.356098 0.790244 1.375610 2.258537  3.556098 5.302439 7.648780 10.478049 13.521951  16.873171 19.926829 22.902439 25.673171 28.102439  30.351220 31.614634 32.946341 34.078049 35.258537  35.843902 36.224390 36.458537 36.575610 36.619512  36.648780 36.653659 36.653659 36.658537 36.658537  36.658537 36.658537 36.658537 36.658537 36.658537  36.658537 36.658537 36.658537 36.658537 36.658537  36.658537
];

rej_3 = [ 
0.936585 0.834146 0.560976 0.321951 0.136585  0.078049 0.034146 0.024390 0.009756 0.000000  0.000000 0.000000 0.000000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000 0.000000  0
];

x_acc_3=(1:size(acc_3,2));
x_rej_3=(1:size(rej_3,2));

%Plot to see EER
%plot(x_acc_3,(acc_3/33)*100,'b--',x_rej_3,rej_3*100,'b--');

%Plot to see ROC
%semilogx((acc_3/33)*100,(1-rej_3)*100,'b--');
plot((acc_3/(n_classes-2))*100,(1-rej_3)*100,plot3_style,'Linewidth',2);












%Plotting 45 degree line
x=(1:100);
y=x;
plot(x,y,line_style,'Linewidth',2);



legend(plot1_label,plot2_label,plot3_label,'Location','SouthEast');
ylim([0 101]);
set(gca,'FontSize',12);
xlabel('False Acceptance Rate(%)');
ylabel('True Acceptance Rate(%)');
hold off;

