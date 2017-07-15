# UI-based Implicit Authentication and Identification
This repository contains all the code and data used to evaluate user interface interactions as an implicit authentication modality on smartphones.
* inc_inter_svm_1..23/ - contains code for SVM based identification accuracy when the number of available interactions was increased from 1 to 23
* inc_inter_gda/ - contains code for GDA based identification accuracy when the number of available interactions was increased from 1 to 35
* inc_inter_knn/ - contains code for KNN based identification accuracy when the number of available interactions was increased from 1 to 35
* changingK/ - contains code for GDA, 3NN, SVM based identification accuracy when the value for K is changed
* box_plot_svm_3,5/, box_plot_gda_3,5/, box_plot_knn_3,5/ - contains code for SVM, GDA, 3NN based identification accuracy respectively using 3/5 apps for training and testing. Results are collected from these directories to create box plots
* inc_users_gda/knn/svm - contains code for GDA, 3NN, SVM based identification accuracy when the number of users is increased from 10 to 42
* one_class_svm - contains code for one class SVM where unknown imposters were assumed, the value of threshold was varied from 0 to 42
* svdd - contains code for SVDD where unknown imposters were assumed, the value of threshold was increased from 0 to 40
* two_class_svm - contains code for two class SVM when unknown imposters were assumed and the value of the threshold was changed from 0 to 40
* maps_src - contains GDA-based identification and SVM-based authentication/identification code
* feature_extraction - contains feature extraction code. Users for whom data is to be extracted are setup in $USERS in datacollect.sh. This script also assumes data will be present in $HOME/new_logs
