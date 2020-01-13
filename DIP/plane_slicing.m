clc;
clear;
close all;
% read an image
a = imread('lena.png');
% Read image size
[m,n] = size(a);
b = double(a);
% convert each pixel into binary using matlab command "de2bi"
c = de2bi(b,8,'left-msb');
% observe from the matrix "C" from the workspace, the matlab command
% "de2bi" will convert two dimentional array into a colomn matrix and each
% calling the MSB Bit of each pixel 
c1 = c(:,1);
r1 = reshape(c1,256,256);
% similarly calling every bit and converting into an arry of size 256X256
% 2nd Bit plane
c2 = c(:,2);
r2 = reshape(c2,256,256);
% 3rd Bit Plane
c3 = c(:,3);
r3 = reshape(c3,256,256);
% 4th Bit Plane
c4 = c(:,4);
r4 = reshape(c4,256,256);
% 5th Bit Plane
c5 = c(:,5);
r5 = reshape(c5,256,256);
% 6th Bit Plane
c6 = c(:,6);
r6 = reshape(c6,256,256);
% 7th Bit Plane
c7 = c(:,7);
r7 = reshape(c7,256,256);
% 8th Bit Plane
c8 = c(:,8);
r8 = reshape(c8,256,256);
% Displaying all the Bit Planes
subplot(241);
imshow(r1);title('MSB Bit Plane');
subplot(242);
imshow(r2);title('2nd Bit Plane');
subplot(243);
imshow(r3);title('3rd Bit Plane');
subplot(244);
imshow(r4);title('4th Bit Plane');
subplot(245);
imshow(r5);title('5th Bit Plane');
subplot(246);
imshow(r6);title('6th Bit Plane');
subplot(247);
imshow(r7);title('7th Bit Plane');
subplot(248);
imshow(r8);title('LSB Bit Plane');
