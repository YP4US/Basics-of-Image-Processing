%Yogesh Pawar
clc;
clear all;
low_in=0.2;
high_in=0.8;
low_out=0;
high_out=1;

g=imread('C:\\Users\\Yogesh Pawar\\Documents\\MATLAB\\IP algorithms\\IP algorithms\\lena_gray_256.tif');

subplot(1,2,1)
imshow(g)
title('Original Image')

[r c]=size(g)
g=double(g);
m=(high_out-low_out)/(high_in-low_in);
m=double(m);
mx=max(g);
mx1=max(mx);
mx2=double(mx1);
g=g/mx2;

for ii=1:r
    for jj=1:c
        px=g(ii,jj);
        if(px<=low_in)
            g(ii,jj)=low_out;
        elseif(px>=low_in && px<=high_in)
            g(ii,jj)=(m*(px-low_in)+low_out);
        elseif(px>=high_in)
            g(ii,jj)=high_out;
        end
    end
end
    g=mx2*g;
    g=im2uint8(mat2gray(g));
    subplot(1,2,2)
    imshow(g)
    title('After intensity Transform')
            