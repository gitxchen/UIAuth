test_mean_err_gda = [
1.640000e+01 15 1.120000e+01 10 9.800000e+00 9.600000e+00 9.600000e+00 8.800000e+00 6.800000e+00 6.400000e+00 6.400000e+00 6.400000e+00 5.800000e+00 6 5 4.800000e+00 4.200000e+00 4.200000e+00 4.400000e+00 4.800000e+00 4.800000e+00 4.600000e+00 4.600000e+00 5 5 5.200000e+00 5 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 5.200000e+00 
];

test_mean_err_knn = [
26 23 20 1.680000e+01 1.460000e+01 1.460000e+01 1.160000e+01 1.280000e+01 1.240000e+01 1.280000e+01 1.080000e+01 10 9.800000e+00 9.800000e+00 8.800000e+00 9.800000e+00 9 8.200000e+00 7.800000e+00 7.600000e+00 6.800000e+00 7.400000e+00 7.200000e+00 7.400000e+00 7.400000e+00 7.400000e+00 7.400000e+00 7.400000e+00 7.200000e+00 7.200000e+00 7.200000e+00 7.200000e+00 7.200000e+00 7.200000e+00 7.200000e+00
];


x=1:size(test_mean_err_gda,2);

hold on;
plot(x,test_mean_err_gda,'r--','Linewidth',2);
plot(x,test_mean_err_knn,'b-.','Linewidth',2);


set(gca,'FontSize',15);
xlabel('No. of interactions per input control');
ylabel('Avg. no. of misclassified app usage sessions');
h_legend=legend('GDA','3NN');
ylim([0 42]);

toplot_legend_best('# of Interactions','Mean # of Misclassified Sessions','',h_legend);

hold off;
print -depsc '/export/scratch/vaibhav/MoST_paper/figures/inc_interactions_42_3'
