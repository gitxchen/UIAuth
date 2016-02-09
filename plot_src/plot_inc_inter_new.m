test_mean_err_gda = [
%1.640000e+01 15 1.120000e+01 10 9.800000e+00 9.600000e+00 9.600000e+00 8.800000e+00 6.800000e+00 6.400000e+00 6.400000e+00 6.400000e+00 5.800000e+00 6 5 4.800000e+00 4.200000e+00 4.200000e+00 4.400000e+00 4.800000e+00 4.800000e+00 4.600000e+00 4.600000e+00 5 5 5.200000e+00 5 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 
13 14 10 9 10 7 8 9 6 6 5 6 6 7 7 8 4 5 5 6 6 6 6 7 7 7 7 7 7 7 7 7 ...
    7 7 7
];

test_mean_err_knn = [
%26 23 20 1.680000e+01 1.460000e+01 1.460000e+01 1.160000e+01 1.280000e+01 1.240000e+01 1.280000e+01 1.080000e+01 10 9.800000e+00 9.800000e+00 8.800000e+00 9.800000e+00 9 8.200000e+00 7.800000e+00 7.600000e+00 6.800000e+00 7.400000e+00 7.200000e+00 7.400000e+00 7.400000e+00 7.400000e+00 7.400000e+00 7.400000e+00 7.200000e+00 7.200000e+00 7.200000e+00 7.200000e+00 7.200000e+00 7.200000e+00 7.200000e+00
28 21 19 17 14 12 9 9 8 12 8 11 9 8 7 9 7 5 7 6 5 6 6 6 6 6 6 6 6 ...
    6 6 6 6 6 6
];

test_mean_err_svm = [
21 11 9 5 3 2 6 3 5 6  6  4  4  7  5  6  7  5  5  5  5  5  5
%1  2  3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
];


x=1:23;

hold on;
plot(x,test_mean_err_svm,'g-','Linewidth',2);
plot(x,test_mean_err_gda(1:23),'r--','Linewidth',2);
plot(x,test_mean_err_knn(1:23),'b-.','Linewidth',2);


set(gca,'FontSize',15);
xlabel('No. of interactions per input control');
ylabel('No. of misclassified app usage sessions');
h_legend=legend('SVM','GDA','3NN');
ylim([0 42]);

toplot_legend_best('# of Interactions','# of Misclassified Sessions','',h_legend);

hold off;
print -depsc '/export/scratch/vaibhav/MoST_paper/figures/inc_interactions_42_4'
