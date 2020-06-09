clc;clear;close all;
%% Edge Detection 
% Using Sobel, canny Filter and dwt2
im = imread('lena.png');
ed = edge(im,'sobel');
ed1 = edge(im,'canny');
imshow(im)
figure
subplot(121)
imshow(ed)
title('Using Sobel Filter')
subplot(122)
imshow(ed1)
title('Using Canny Filter')
%% High pass and low pass filtering
kerhp = [-1 -1 -1;-1 8 -1;-1 -1 -1];
kerlp = 1/9 * [1 1 1;1 1 1;1 1 1];
im = imread('lena.png');
hp = imfilter(im,kerhp);
lp = imfilter(im,kerlp);
imshow(im)
title('Original Image')
figure
subplot(121)
imshow(hp)
title('High pass filtered image')
subplot(122)
imshow(lp)
title('Low pass filtered image')
%% dwt2 edge detection
clc; clear;close all
rgbimage=rgb2gray(imread('lena.png'));
[numrows,numcols]=size(rgbimage);
%wfilters returns the pair of type filters associated with the orthogonal or biorthogonal wavelet wname.
[LoD,HiD] = wfilters('haar','d');
[cA,cH,cV,cD] = dwt2(rgbimage,LoD,HiD,'mode','symh');
subplot(2,2,1)
%plot using approximation coefficients.
imagesc(cA)
colormap gray
title('Approximation')
subplot(2,2,2)
%plot using horizontal coefficients.
imagesc(cH)
colormap gray
title('Horizontal')
subplot(2,2,3)
%plot using vertical coefficients.
imagesc(cV)
colormap gray
title('Vertical')
subplot(2,2,4)
%plot using diagonal coefficients.
imagesc(cD)
colormap gray
title('Diagonal')
