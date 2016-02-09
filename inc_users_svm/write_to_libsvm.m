function write_to_libsvm(user,app,input_control,fs,count)
  epsilon = 0.0000000001;
  data=loadDataFromFile(user,app,input_control,count);
  data=getFeatureSubset(data,fs);
  zero_vec=zeros(size(data,1),1);
  for i=1:size(data,2)
    compare_vec= data(:,i)==zero_vec;
    if sum(compare_vec==1)==size(data,1)
      data(1,i)=epsilon;
    end
  end
  labels=zeros(size(data,1),1)+user;
  log_dir=strcat(getenv('PWD'),'/logs/');
  filename = strcat(log_dir,'user',int2str(user),'-',input_control, ...
                    '-app',int2str(app),'-downup.scale');
  libsvmwrite(filename,labels,sparse(data));
end
