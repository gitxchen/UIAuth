function result = loadDataFromFile(user,app,input_control,count)
  log_dir=strcat(getenv('PWD'),'/logs/');
  result=load(strcat(log_dir,'user',int2str(user),'-',input_control,'-app',int2str(app),'-downup.log'));
  if count < size(result,1)
    result=result(1:count,:);
  end
end


