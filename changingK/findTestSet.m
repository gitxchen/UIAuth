function [start,end_set] = findTestSet(test_set_sizes,class)
  start=0;
  end_set=0;
  if class==1
    start=1;
    end_set=test_set_sizes(class,1);
  end
  if class ~= 1
    start=sum(test_set_sizes(1:class-1,:))+1;
    end_set=start+test_set_sizes(class,1)-1;
  end
end
