clc;clear;close all;
%% Read an image
rd = imread('img1.jpg');
%Writing Image with different extension
imwrite(rd,'img1_1.png');

%% Histogram of Image
rd = imread('img1.jpg');
%Plotting histogram of an image
histogram(rd)

%% DWT2
rd = imread('img1.jpg');
[cA,cH,cV,cD] = dwt2(rd,'sym4','mode','per');
imagesc(cA) 
title('Approximation Coefficients')

%% Histogram Equalization (by - BT17ECE035)
clc;clear;close all;
rd = rgb2gray(imread('img2.jpg')); %Reading an image
[m,n] = size(rd);
rd = double(rd);
hist1 = zeros(1,256);
%Getting histogram 1
hist1 = get_hist(rd,m,n,1,0);
%Calculate PDF
pdf = hist1 * (1/(m*n));
%Calculate CDF
cdf = zeros(1,256);
cdf = cumsum(pdf);
cdf = round(255*cdf);   %Round off
%Reconstruct the output image from cdf corresponding freq
rn = zeros(1,256);
rn = get_hist(rd,m,n,2,cdf);
%Creating Equalized Histogram
hist2 = zeros(1,256);
hist2 = get_hist(rn,m,n,1,0);
%Plotting the figures
subplot(121)
imshow(uint8(rd));
title('Original Image')
subplot(122)
imshow(uint8(rn))
title('Modified Image')
figure
subplot(121)
plot(hist1)
title('Normal histogram')
subplot(122)
plot(hist2)
title('Eualized Histogram')
% for i = 1:m
%     for j = 1:n
%           for k = 0:255
%               if rd(i,j) == k
%                   rn(i,j) = cdf(k+1);
%               end
%           end
%     end
% end