function predictions=nearestNeighborSearch(X_PCA,trainPerson,testIm,V_PCA,average)
  predictions=zeros(numel(testIm),1);
  for i=1:numel(testIm)
    XTest=reshape(testIm{i},2500,1);
    
    %subtract test image vector by average vector
    average=reshape(average,2500,1);
    XTest=XTest.-average;
    
    %get representation of test vector 
    XTest_PCA=V_PCA'*XTest;
    
    %compute distances of vectors in X_PCA to XTest_PCA
    dist=X_PCA.-repmat(XTest_PCA,1,size(X_PCA)(2));
    dist=dist.^2;
    dist=sum(dist);
    
    %find min distance and min index
    [minDist,minIndex]=min(dist);
    predictions(i)=trainPerson(minIndex);
  end
end
