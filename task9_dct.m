clc;clear;close all;
%Reading the image
im = rgb2gray(imread('lena_8.png'));
%applying dct transform
img_dct = dct2(im);
Norm_Mat=[16 11 10 16 24 40 51 61       % Normalization matrix (8 X 8) used to Normalize the DCT Matrix.
          12 12 14 19 26 58 60 55
          14 13 16 24 40 57 69 56
          14 17 22 29 51 87 80 62
          18 22 37 56 68 109 103 77
          24 35 55 64 81 104 113 92
          49 64 78 87 103 121 120 101
          72 92 95 98 112 100 103 99];
q_mat = round(img_dct./Norm_Mat);
lvec = zig_zag(q_mat);
rle = my_RLE(lvec);