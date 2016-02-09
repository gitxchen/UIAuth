function [result,sizes]=loadDataFromFiles(users,input_control,fs)
  result=[];
  sizes=[];
  for i=1:size(users,1)
    tmp=loadDataFromFile(users(i,1),input_control);
    result=[result;tmp];
    sizes=[sizes;size(tmp,1)];
  end
  result=getFeatureSubset(result,fs);
end

