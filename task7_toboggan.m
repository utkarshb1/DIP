clc;
clear;
close all;
%Load the image
% img = imread('img1.jpg');
img = [12 14 23 13; 16 11 21 18; 21 24 23 12; 12 21 20 10];
img1 = [4 4 3 2;3 7 6 1; 2 7 6 2; 0 1 0 2];
[m,n] = size(img);
cimg = [256*ones(m,1),img,256*ones(m,1)];
rimg = [256*ones(1,n+2);cimg;256*ones(1,n+2)];
cimg1 = [256*ones(m,1),img1,256*ones(m,1)];
rimg1 = [256*ones(1,n+2);cimg1;256*ones(1,n+2)];
for i = 2:m+1
    for j = 2:n+1
        img1(i-1,j-1) = tob_pix(i,j,rimg,rimg1);
    end
end
img1