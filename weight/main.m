% Please set matList,nLabel,s_k,e_k,R.
% matList is struct whose value is data matrix
matList(1).value=button;
matList(2).value=checkbox;
matList(3).value=edittext;
matList(4).value=picker;

% nLable is number of labels
nLabel=42;

%[s_k,e_k] is range of k-neighbors
s_k=3;
e_k=10;

mat_n_count=zeros(length(matList),e_k-s_k+1);
mat_n_knn=zeros(length(matList),e_k-s_k+1);
list_sum_out_knn_dist=zeros(length(matList),e_k-s_k+1);
for i= 1:length(matList)
    dataMatrix=matList(i).value;

    [n_count,n_knn,sum_out_knn_dist]=countKNN(dataMatrix,nLabel,s_k,e_k);
    mat_n_count(i,:)=n_count;
    mat_n_knn(i,:)=n_knn;
    list_sum_out_knn_dist(i,:)=sum_out_knn_dist;
    %result=n_count./n_knn; % or n_count./n_knn
end
%Based on n_count./n_knn vector, determine the best 'k'
%Add some statistical method to compare n_count./n_knn in different feature
%sets according to k
%Then, call weightCom

%Please additionally set index_k,R,rand_a,rand_b

weight = weightCom(matList,mat_n_count,mat_n_knn,list_sum_out_knn_dist,2,5,0.5,1.5);

%index_k is the index of best 'k' in (mat_n_count,mat_n_knn,list_sum_out_knn_dist)
%For ex, if you use [3,10] for range in k and 4 is the best k, index_k is 2

index_k=2;

%R is round to adjust weight vector
%So far, 5 looks okay!
%More precise comparison, continually check weight based on list_sum_out_knn_dist(:,index_k)
% That is, shorter distance in list_sum_out_knn_dist should have larger
% weight.
R=5;

%[rand_a,rand_b] is random interal since initial weight is randomly chosen
% I used [0.5,1.5] just like Wang et al's paper (CCS14)
rand_a=0.5;
rand_b=1.5;

% Call weight function:
weight = weightComm(matList,mat_n_count,mat_n_knn,list_sum_out_knn_dist,index_k,R,rand_a,rand_b)