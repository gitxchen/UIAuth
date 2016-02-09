function result = loadAppDataFromFile(user,app,input_control)
  log_dir=strcat(getenv('PWD'),'/logs/');
  result=load(strcat(log_dir,'user',int2str(user),'-',input_control,'-maps-downup.log'));
  result=getSubset(result,app);
end


