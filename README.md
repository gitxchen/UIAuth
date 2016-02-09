# ImplicitAuthentication
This repository contains all the code and data used to evaluate user interface interactions as an implicit authentication modality on smartphones.
* inc_inter_svm_1..23/ - contains code for SVM based identification accuracy when the number of available interactions was increased from 1 to 23
* inc_inter_gda/ - contains code for GDA based identification accuracy when the number of available interactions was increased from 1 to 35
* inc_inter_knn/ - contains code for KNN based identification accuracy when the number of available interactions was increased from 1 to 35
* changingK/ - contains code for GDA, 3NN, SVM based identification accuracy when the value for K is changed
* box_plot_svm_3,5/, box_plot_gda_3,5/, box_plot_knn_3,5/ - contains code for SVM, GDA, 3NN based identification accuracy respectively using 3/5 apps for training and testing. Results are collected from these directories to create box plots
* inc_users_gda/knn/svm - contains code for GDA, 3NN, SVM based identification accuracy when the number of users is increased from 10 to 42