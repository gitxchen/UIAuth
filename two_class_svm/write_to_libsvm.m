function write_to_libsvm(user,app,input_control,fs)
  data=loadDataFromFile(user,app,input_control);
  data=getFeatureSubset(data,fs);
  labels=zeros(size(data,1),1)+user;
  log_dir=strcat(getenv('PWD'),'/logs/');
  filename = strcat(log_dir,'user',int2str(user),'-',input_control, ...
                    '-app',int2str(app),'-downup.scale');
  libsvmwrite(filename,labels,sparse(data));
end
