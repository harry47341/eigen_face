function [X_PCA,V] = eigenPCA (k,im,average)
  %unroll data onto 2500-dimensional vectors
  %each column of X is one 2500-dimensional vector
  X=zeros(2500,0);
  for i=1:size(im)(2)
    X=[X,reshape(im{i},2500,1)];
  endfor
 
  %Subtract each vector by mean vector
  average=reshape(average,2500,1);
  X=X.-repmat(average,1,size(im)(2));
  [V,delta]=eig(X'*X);
  
  %find top k eigen vectors
  [delta,sortOrder]=sort(diag(delta),'descend');
  V=V(:,sortOrder);
  V=X*V;
  V=V(:,1:k);
  
  %normalize each vector of V into unit length
  for i=1:k
    V(:,i)=V(:,i)/norm(V(:,i));
  end
  
  %visualize eigen faces
  fig=figure;
  axis image, axis off, colormap gray;
  for i=1:9
    subplot(3,3,i);
    imgVec=reshape(V(:,i),50,50);
    imagesc(imgVec);
    title(strcat('Eigen face #',int2str(i)));
  end
  filename=strcat('Eigen faces');
  saveas(fig,filename,'png');
  X_PCA=V'*X;
  
  
end

  