function im2=preNormalize(im)
  im2={};
  for i=1:size(im)(2)
    meanVal=1.0*sum(sum(im{i}))/(prod(size(im{i})));
    std_dev=std(reshape(im{i}.',1,[]));
    %fprintf("mean: %f\nstd_dev: %f",mean,std_dev);
    im2{i}=(im{i}.-meanVal)./std_dev;
   
  endfor
end
