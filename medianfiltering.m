%Yogesh Pawar
clc
clear all
close all
a=imread('C:\\Users\\Yogesh Pawar\\Downloads\\the-big-bang-theory-team.jpg');
%Addition of salt and pepper noise
b=imnoise(a,'salt & pepper',0.1);
%Defining the box and median filters
h1=1/9*ones(3,3);
h2=1/25*ones(5,5);
c1=conv2(b,h1,'same');
c2=conv2(b,h2,'same');
c3=medfilt2(b,[3 3]);
c4=medfilt2(b,[5 5]);
subplot(3,2,1),imshow(a),title('Original image')
subplot(3,2,2),imshow(b),title('Salt & pepper noise')
subplot(3,2,3),imshow(uint8(c1)),title('3 x 3 smoothing')
subplot(3,2,4),imshow(uint8(c2)),title('5 x 5 smoothing')
subplot(3,2,5),imshow(uint8(c3)),title('3x 3 Median filter')
subplot(3,2,6),imshow(uint8(c4)),title('5 x 5 Median filter')

