clc; clear;close all;
%Get input vector
vec = randi([0 1],1,100);
d = my_RLE(vec);
len_out = length(d);
len_ip = length(vec);

if (len_out / len_ip) <1
    fprintf('Positive Compression with ratio = %.2d\n', len_out / len_ip)
else
    fprintf('Negative compression.')
end