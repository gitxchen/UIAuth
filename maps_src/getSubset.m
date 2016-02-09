function result=getSubset(data,subset)
  data_size=size(data,1);
  data_size=data_size - mod(data_size,5);
  data=data(1:data_size,:);
  subset_size=data_size/5;
  result=data( ((subset-1)*subset_size) + 1:subset*subset_size,:);
end
