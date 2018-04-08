function [N,testIm,testPerson,testNumber,trainIm,trainPerson,trainNumber] =getSets(im,person,number,subset,trainingSubsets)
 testPerson=testNumber=trainSet=trainPerson=trainNumber=zeros(0,0);
 testIm=trainIm={};
 for i=1:size(im)(2)
   if(any(trainingSubsets==subset(i)))
    trainIm{1,size(trainIm)(2)+1}=im{i};
    trainPerson=[trainPerson,person(i)];
    trainNumber=[trainNumber,size(trainIm)(2)];
   else
    testIm{1,size(testIm)(2)+1}=im{i};
    testPerson=[testPerson,person(i)];
    testNumber=[testNumber,size(testIm)(2)];
  endif
endfor
N=size(trainIm)(2);

end


    