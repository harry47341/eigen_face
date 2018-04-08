function reconstructFromEigen(index,imOriginal,im,V_PCA,average)
     fig=figure;
     axis image, axis off, colormap gray;
     title('Reconstruction from Eigen');
     average=reshape(average,2500,1);
     for j=1:numel(index)
      i=index(j);
      X=reshape(im{i},2500,1);
      
      %subtract image vector by average vector
      X=X.-average;
      
      %get representation of image vector 
      X=V_PCA'*X;
      
      %reconstruct image vector
      im_after=average+V_PCA*X;
      
      
      %print original and reconstructed faces
      subplot(2,5,j);
      imagesc(imOriginal{i});
      %title(strcat('Original: Subset ',int2str(j)));
      subplot(2,5,5+j);
      im_after=reshape(im_after,50,50);
      imagesc(im_after);
      %title(strcat('Reconstructed: Subset ',int2str(j)));
    end
     filename=strcat('Reconstructed Eigen faces');
     saveas(fig,filename,'png');
  end
  
    
    