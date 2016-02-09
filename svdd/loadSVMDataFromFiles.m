function [ret_labels,ret_sizes,ret_data] = loadSVMDataFromFiles(users,apps,input_control,fs)
  ret_data=[];
  ret_sizes=[];
  ret_labels=[];
  for i=1:size(users,1)
    for j=1:size(apps)
      [label_t,data_t]=loadSVMDataFromFile(users(i,1),apps(j,1),input_control,fs);
      ret_data=[ret_data;data_t];
      ret_labels=[ret_labels;label_t];
      ret_sizes=[ret_sizes;size(data_t,1)];
    end
  end
end


