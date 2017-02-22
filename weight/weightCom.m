% Function weight=weightComm(dataMatrix,nLabel,dataName,s_k,e_k)
% Input:
%      matList: struct, e.g.,matList(1).value=button
%      mat_n_count: list of number of bad instances
%      mat_n_knn: list of number of knns in other groups
%      list_sum_out_knn_dist: list of sum of distances to knns in other
%      groups
%      index_k: index of best 'k' in
%      (mat_n_count,mat_n_knn,list_sum_out_knn_dist)
%      R: round R to adjust weight vector w.
%      [rand_a,rand_b]: random interval
% Output:
%       weight: [w_1,...,w_n] for n feature sets
function weight = weightComm(matList,mat_n_count,mat_n_knn,list_sum_out_knn_dist,index_k,R,rand_a,rand_b)
    fprintf('Initial random weight Matrix: \n')
    weight=rand_a + (rand_b-rand_a).*rand(length(matList),1); %initial weights for each feature set
    
    temp=1;
    C1=0;
    for i=1:R
        fprintf('Round %d \n',i)
        for j=1:length(matList)
           
            if list_sum_out_knn_dist(j,index_k) ~= min(list_sum_out_knn_dist(:,index_k))
                prob=mat_n_count(j,index_k)/mat_n_knn(j,index_k);
                
                change(temp)=weight(j)*0.01*prob*(0.2+prob);
                C1 = C1*change(temp)*list_sum_out_knn_dist(j,index_k);
                weight(j)=weight(j)-change(temp);
                temp = temp+1;
            end
        end
        totalfd=0;
        for j=1:length(matList)
            if list_sum_out_knn_dist(j,index_k) == min(list_sum_out_knn_dist(:,index_k)) && weight(j)>0
                totalfd = totalfd+list_sum_out_knn_dist(j,index_k);
            end
        end
        for j=1:length(matList)
            if list_sum_out_knn_dist(j,index_k) == min(list_sum_out_knn_dist(:,index_k)) && weight(j)>0
                weight(j) = C1/totalfd;
            end
        end
    end
    
    for j=1:length(matList)
        if weight(j) >0
            weight(j) = weight(j)*(0.9+mod(rand(),100)/500)
        end
    end
    %weight=weight./sum(weight)
end
