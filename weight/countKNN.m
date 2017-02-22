% Function [n_count,n_knn,n_in_knn] = countKNN(dataMatrix,nClass,s_k,e_k)
% Input:
%      dataMatrix: (f_1,....f_n,label,session)
%      nClass    : number of people
%      [s_k,e_k] : number of k nearest neighbors
% Output:
%       n_count  : number of knns in other groups (< max_within_group_distance)
%                 [c_1,...,c_k] for k neighbors 
%       n_knn    : total number of knns
%                 [n_1,...,n_k] for k neighbors 
%       n_in_knn: average number of instances per group 
%                  n
%       sum_out_knn_dist: sum of distances to knn in other groups
function [n_count,n_knn,sum_out_knn_dist] = countKNN(dataMatrix,nClass,s_k,e_k)
    fprintf('Dimension reduction \n')
    [COEFF,SCORE] = princomp(dataMatrix(:,1:11));
    reduced_data=[dataMatrix(:,12:12) SCORE(:,1:1) SCORE(:,2:2)];
    
    fprintf('Find k neighbors \n')
    i=1;
    n_count=zeros(1,e_k-s_k+1); % Number of knns in other groups whose distance is less than max distance within group
    n_knn=zeros(1,e_k-s_k+1); % Number of knns in other groups
    n_in_knn=0; % Number of instances within-group
    sum_out_knn_dist=0; % Sum of distances to knn in other groups
    for k=s_k:e_k
        
        %eval(['tot_count_' dataName num2str(k) '=0']);
        %eval(['tot_count_' dataName '=zeros(0,e_k-s_k+1)']);
        for index=1:nClass % For each person,
            target=reduced_data(reduced_data(:,1)==index,:); % instances in same group (person)
            others=reduced_data(reduced_data(:,1)~=index,:); % instances in other group (people)
            %others=reduced_data_open(reduced_data_open(:,1)==120900,:);
            in_knn=[];
            out_knn=[];
            %tot=0.0;
            max=0.0;
            for c= 1:length(target)  
                total=0.0;
                
                A=[target(c,2) target(c,3)];
                sub_knn=[];
                for r=1:length(target)
                    temp=0.0;
                    B=[target(r,2) target(r,3)];
                    temp=sqrt(sum((A-B).^2));
                    sub_knn(end+1)=temp;
                    if (temp>max)
                        max=temp; % find max distance within group for each person
                    end
                    total=total+temp;
                end
                
                in_knn=sub_knn;
                %in_knn=[in_knn sub_knn(1:k)];
                %tot=tot+total/length(target);
            end
            %ans2=tot/length(target);
            %fprintf tot/length(target)
            %tot=0.0;

            
            for c= 1:length(target)  
                total=0.0;
                A=[target(c,2) target(c,3)];
                sub_knn=[];
                for r=1:length(others)
                    temp=0.0;
                    B=[others(r,2) others(r,3)];
                    temp=sqrt(sum((A-B).^2));
                    sub_knn(end+1)=temp; %distance to other group instances

                    total=total+temp;
                end
                sort(sub_knn);

                out_knn=[out_knn sub_knn(1:k)]; %select k nearest neighbors in other groups
            end
            sum_out_knn_dist(i)=sum(out_knn);
            sort(out_knn);
            count=0;
            for c=1:length(out_knn)
                
                %disp(out_knn(1,c))
                %disp(in_knn)
                if (out_knn(1,c)<max) % count number of k nearest neighbors in other groups whose distasnce is less than max distance within same group
                    count=count+1;
                end

            end
            %eval(['tot_count_' dataName num2str(k) '= tot_count_' dataName num2str(k) '+count']);
            n_count(i) = n_count(i) + count;
            


            %ans=tot/length(target);
            fprintf ('Number of %d nearest neighbors for person %d is %d \n',k,index,count)
            %fprintf ('length of knn: %d \n',length(out_knn))
           
            n_knn(i) = n_knn(i) + length(out_knn);
            length(target)
            n_in_knn = n_in_knn + length(target);
            %n_count(i)
            %n_knn(i)
        end
        %fprintf tot/length(target)
        %n_count(i)
        %n_knn(i)
        %eval(['weight(i,:)' '= tot_count_' dataName num2str(k)])
        %fprintf eval(['tot_count' dataName num2str(k)])
        
        i=i+1;
    end
    n_in_knn;
    n_in_knn=n_in_knn/(nClass*(e_k-s_k+1));
end