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

%% Histogram Equalization
rd = rgb2gray(imread('img2.jpg'));
s = size(rd);
rd = double(rd);

hist1 = zeros(1,256);
for i = 1:s(1)          %Create histogram of the original image
    for j = 1:s(2)
        for k = 0:255
            if rd(i,j) == k
                hist1(k+1) = hist1(k+1)+1;
            end
        end
    end
end
%Calculate PDF
pdf = hist1 * (1/(s(1)*s(2)));
%Calculate CDF
cdf = zeros(1,256);
cdf(1) = pdf(1);
for i = 2:255
    cdf(i) = cdf(i-1) + pdf(i);
end
cdf = round(255*cdf);   %Round off
%Reconstruct the output image from cdf corresponding freq
rn = zeros(1,256);
for i = 1:s(1)
    for j = 1:s(2)
          for k = 0:255
              if rd(i,j) == k
                  rn(i,j) = cdf(k+1);
              end
          end
    end
end
%Creating Equalized Histogram
hist2 = zeros(1,256);
for i = 1:s(1)
    for j = 1:s(2)
        for k = 0:255
            if rn(i,j) == k
                hist2(k+1) = hist2(k+1)+1;
            end
        end
    end
end
subplot(121)
imshow(uint8(rd));
subplot(122)
imshow(uint8(rn))
figure
subplot(121)
plot(hist1)
subplot(122)
plot(hist2)