function [start_ind,end_ind]= getSessionForClass(sizes,class)
  start_ind=0;
  end_ind=sum(sizes(1:class,:));
  if class==1
    start_ind=1;
  else
    start_ind=sum(sizes(1:(class-1),:))+1;
  end
end
