function [label,data] = loadSVMDataFromFile(user,app,input_control,fs,count)
  write_to_libsvm(user,app,input_control,fs,count);
  log_dir=strcat(getenv('PWD'),'/logs/');
  [label,data]=libsvmread(strcat(log_dir,'user',int2str(user),'-',input_control,'-app',int2str(app),'-downup.scale'));
end


