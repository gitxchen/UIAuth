function result = getFeatureSubset(input,fs)
  result=[];
  for i=1:size(fs,2)
    if fs(1,i)=='1'
      result=[result input(:,i)];  
    end
  end
end



