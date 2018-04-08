%face recognition with eigen faces

clear; close all; clc
pkg load image;
%C: number of classes
%training with subset 1 and 5
%using 9 Eigen vectors to represent images
numOfEigenFaces=30;
trainingSubsets=[1,5];
subsetSizes=[7,12,12,14,19];
C=10;

%Read in data from faces folder, initialize
%data is split into 5 subsets:
%Set 1. person*01.png to person*07.png
%Set 2. person*08.png to person*19.png
%Set 3. person*20.png to person*31.png
%Set 4. person*32.png to person*45.png
%Set 5. person*46.png to person*64.png 
fprintf('loading data...\n');
[imOriginal,person,number,subset]= readFaceImages('faces');

%pre-Normalize dataset
im=preNormalize(imOriginal);

%Split data into test and training sets
[N,testIm,testPerson,testNumber,trainIm,trainPerson,trainNumber]=getSets(im,person,number,subset,trainingSubsets);
   
%compute average face;
fprintf("computing average face...\n");
average=getAverage(trainIm);

%pca to reduce dimensions
%X_PCA: representation of each image using eigen vectors
%V_PCA: top N-C eigen vectors
fprintf("computing eigen faces...\n");
[X_PCA,V_PCA]=eigenPCA(numOfEigenFaces,trainIm,average);

%Use nearest neighbor search to predict testset images
fprintf("Using nearest neighbor search...\n");
predictions=nearestNeighborSearch(X_PCA,trainPerson,testIm,V_PCA,average);
predictions=predictions';

%Compare predictions with ground truth
fprintf("Comparing predictions with ground truth...\n");
numWrong=sum(logical(predictions-testPerson));
numRight=numel(predictions)-numWrong;
printf('Numer right: %d\n',numRight);
printf("Number wrong: %d\n",numWrong);
printf("Proportion of right predictions:%d\n",numRight*1.0/(numRight+numWrong));

%Reconstructing one face from each subset for person 1...
index=[1,8,20,32,46];
reconstructFromEigen(index,imOriginal,im,V_PCA,average);
