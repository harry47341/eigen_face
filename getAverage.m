function average=getAverage(im)
  average=zeros(50,50);
  for i=1:size(im)(2)
      average=average.+im{i};
   endfor
  average=average./size(im)(2);
 
end
