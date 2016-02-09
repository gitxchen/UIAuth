hold on;

roc=0; %roc=0 means plot eer
n_classes=42;

plot1_style='r+-.';
plot1_linecolor='r';
plot1_marker='+';
plot1_linestyle='-.';

plot2_style='ms--';
plot2_linecolor='m';
plot2_marker='s';
plot2_linestyle='--';

plot3_style='b<-';
plot3_linecolor='b';
plot3_marker='<';
plot3_linestyle='-';

%plot4_style='c.-.';
line_style='k:';

%h=findobj(gca,'Type','text');
%set(h,'FontSize',14);
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

x_acc_1=(1:size(acc_1,2));
x_rej_1=(1:size(rej_1,2));

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




if roc==0
  %Plot to see EER

  %EER_1
  [ax,p1,p2]=plot_eer_42(x_acc_1,(acc_1/(n_classes-1))*100,x_rej_1,rej_1*100,plot1_linecolor,plot1_linestyle);
  %[ax,p1,p2]=plotyy(x_acc,(acc_1/(n_classes-1))*100,x_rej,rej_1*100);
  %p1.LineStyle='--';
  %p1.Color='r';
  %p2.LineStyle='--';
  %p2.Color='r';
  %ax(1).YColor='k';
  %ax(2).YColor='k';
  %set(ax(1),'ylim',[0 101]);
  %set(ax(2),'ylim',[0 101]);
  %ax(1).YTick=0:10:100;
  %ax(2).YTick=0:10:100;
  %set(get(ax(1),'Ylabel'),'String','Avg. False Acceptance Rate(%)') 
  %set(get(ax(2),'Ylabel'),'String','Avg. False Rejection Rate(%)') 
  
  p11=p1;
  p12=p2;

  
  %EER_2
  [ax,p1,p2]=plot_eer_42(x_acc_2,(acc_2/(n_classes-1))*100,x_rej_2,rej_2*100,plot2_linecolor,plot2_linestyle);
  %[ax,p1,p2]=plotyy(x_acc,(acc_2/(n_classes-1))*100,x_rej,rej_2*100);
  %p1.LineStyle='--';
  %p1.Color='g';
  %p2.LineStyle='--';
  %p2.Color='g';
  %ax(1).YColor='k';
  %ax(2).YColor='k';
  %set(ax(1),'ylim',[0 101]);
  %set(ax(2),'ylim',[0 101]);
  %ax(1).YTick=0:10:100;
  %ax(2).YTick=0:10:100;
  %set(get(ax(1),'Ylabel'),'String','Avg. False Acceptance Rate(%)') 
  %set(get(ax(2),'Ylabel'),'String','Avg. False Rejection Rate(%)') 
  
  p21=p1;
  p22=p2;

  
  %EER_3
  [ax,p1,p2]=plot_eer_42(x_acc_3,(acc_3/(n_classes-2))*100,x_rej_3,rej_3*100,plot3_linecolor,plot3_linestyle);
  %[ax,p1,p2]=plotyy(x_acc,(acc_3/(n_classes-2))*100,x_rej,rej_3*100);
  %p1.LineStyle='--';
  %p1.Color='b';
  %p2.LineStyle='--';
  %p2.Color='b';
  %ax(1).YColor='k';
  %ax(2).YColor='k';
  %set(ax(1),'ylim',[0 101]);
  %set(ax(2),'ylim',[0 101]);
  %ax(1).YTick=0:5:100;
  %ax(2).YTick=0:5:100;
  
  %set(get(ax(1),'Ylabel'),'String','Avg. False Acceptance Rate(%)') 
  %set(get(ax(2),'Ylabel'),'String','Avg. False Rejection Rate(%)') 
  
  p31=p1;
  p32=p2;

  %set(ax(1),'xlim',[0 40]);
  %set(ax(2),'xlim',[0 40]);

  %set(ax(1),'YColor','k');
  %set(ax(2),'YColor','k');
  
  %set(get(ax(1),'Xlabel'),'String','Threshold','FontSize',14) 
  %set(get(ax(1),'Ylabel'),'String','Mean False Acceptance Rate(%)','fontsize',14) 
  %set(get(ax(2),'Ylabel'),'String','Mean False Rejection Rate(%)','fontsize',14) 
  
  circle(5.9,8.3,1,plot3_linecolor);
  circle(8.23,33.84,1,plot2_linecolor);
  circle(3.01,24.95,1,plot1_linecolor);
  h_legend=legend([p31;p11;p21],plot3_label,plot1_label,plot2_label);
  %xlhand = get(gca,'xlabel')
  %set(xlhand,'string','Threshold','fontsize',14)
  %ylhand = get(gca,'ylabel')
  %set(ylhand,'string','Mean False Acceptance Rate(%)','fontsize',14)

  toplot_legend_yy('Threshold','Mean False Acceptance Rate(%)','Mean False Rejection Rate(%)','',h_legend,ax);
  print -depsc '/export/scratch/vaibhav/MoST_paper/figures/eer_42_4'
else
  
  %Plot to see ROC
  %semilogx((acc/33)*100,(1-rej)*100,'b--');
  plot((acc_3/(n_classes-2))*100,(1-rej_3)*100,plot3_style,'Linewidth',2);
  plot((acc_1/(n_classes-1))*100,(1-rej_1)*100,plot1_style,'Linewidth',2);
  plot((acc_2/(n_classes-1))*100,(1-rej_2)*100,plot2_style,'Linewidth',2);
  
  %Plotting 45 degree line
  x=(1:100);
  y=x;
  plot(x,y,line_style,'Linewidth',2);
  
  h_legend = legend(plot3_label,plot1_label,plot2_label,'Location','SouthEast');
  ylim([0 101]);
  set(gca,'XTick',[0:20:100]);
  %set(gca,'FontSize',14); 
  %h=findobj(gca,'Type','text');
  %set(h,'FontSize',14);

  %xlhand = get(gca,'xlabel');
  %set(xlhand,'string','Mean False Acceptance Rate(%)','fontsize',14);
  %ylhand = get(gca,'ylabel');
  %set(ylhand,'string','Mean True Acceptance Rate(%)','fontsize',14);
  toplot_legend('Mean False Acceptance Rate(%)','Mean True Acceptance Rate(%)','',h_legend);
  print -depsc '/export/scratch/vaibhav/MoST_paper/figures/roc_42_4'
end






hold off;

