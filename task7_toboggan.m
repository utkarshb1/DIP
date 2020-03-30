clc;clear;close all;
%Taking a sample image matrix
img = [12 14 23 13; 16 11 21 18; 21 24 23 12; 12 21 20 10];
%Taking the kernal to be mapped with image
kernel_old = [4 4 3 2;3 7 6 1; 2 7 6 2; 0 1 0 2];
kernel_new = [4 4 3 2;3 7 6 1; 2 7 6 2; 0 1 0 2];
[m,n] = size(img);
%Padding 256 around the image
cimg = [256*ones(m,1),img,256*ones(m,1)];
rimg = [256*ones(1,n+2);cimg;256*ones(1,n+2)];
cimg1 = [256*ones(m,1),kernel_new,256*ones(m,1)];
rimg1 = [256*ones(1,n+2);cimg1;256*ones(1,n+2)];
%Implementing Toboggan algo
for i = 2:m+1
    for j = 2:n+1
        kernel_new(i-1,j-1) = tob_pix(i,j,rimg,rimg1);
    end
end
kernel_new