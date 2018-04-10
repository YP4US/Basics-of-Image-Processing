%Yogesh Pawar
%This program performs gray level slicing with background
clc;
clear all;
close all;
x=imread('C:\Users\Yogesh Pawar\Documents\MATLAB\IP algorithms\IP algorithms\lenna.jpg');
x=imresize(x,[256 256]);
y=double(x);
[m,n]=size(y);
L=double(255);
a=double(round(L/1.25));
b=double(round(2*L/2));
for i=1:m
    for j=1:n
        if (y(i,j)>=a & y(i,j)<=b)
            z(i,j)=L;
        else
            z(i,j)=y(i,j);
        end
    end
end
imshow(uint8(y));
figure,imshow(uint8(z));
