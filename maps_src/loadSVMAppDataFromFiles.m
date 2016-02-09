function [ret_labels,ret_sizes,ret_data] = loadSVMAppDataFromFiles(users,apps,input_control,fs)
  ret_data=[];
  ret_sizes=[];
  ret_labels=[];
  for i=1:size(users,1)
    [label_t,data_t]=loadSVMAppDataFromFile(users(i,1),apps(j,1),input_control,fs);
    %fprintf('loadSVMDataFromFiles: user=%d app=%d input_control=%s fs=%s size(data_t)=%d size(label_t)=%d\n',users(i,1),apps(j,1),input_control,fs,size(data_t,1),size(label_t,1));
    ret_data=[ret_data;data_t];
    ret_labels=[ret_labels;label_t];
    ret_sizes=[ret_sizes;size(data_t,1)];
  end
end


