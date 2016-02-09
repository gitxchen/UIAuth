function [label,data] = loadSVMAppDataFromFile(user,app,input_control,fs)
  write_app_to_libsvm(user,app,input_control,fs);
  log_dir=strcat(getenv('PWD'),'/logs/');
  [label,data]=libsvmread(strcat(log_dir,'user',int2str(user),'-',input_control,'-app',int2str(app),'-downup.scale'));
end


