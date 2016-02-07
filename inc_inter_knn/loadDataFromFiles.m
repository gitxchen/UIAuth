function [result,sizes]=loadDataFromFiles(users,apps,input_control,fs,count)
  result=[];
  sizes=[];
  for i=1:size(users,1)
    for j=1:size(apps)
      tmp=loadDataFromFile(users(i,1),apps(j,1),input_control,count);
      result=[result;tmp];
      sizes=[sizes;size(tmp,1)];
    end
  end
  result=getFeatureSubset(result,fs);
end

