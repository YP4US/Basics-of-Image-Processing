%Yogesh Pawar
%dialation and erosion

clear all
clc
a=imread('C:\\Users\\Yogesh Pawar\\Documents\\MATLAB\\MATLAB\\coin.JPG');
p=size(a);

%%% using in built MATLAB function %%%

s=strel('square',3);
d1=imdilate(a,s);
d2=imerode(a,s);

%%% Writing program
w=[1 1 1;1 1 1;1 1 1];
for x=2:1:p(1)-1
    for y=2:1:p(2)-1
         a1=[w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1) w(4)*a(x,y-1) w(5)*a(x,y) w(6)*a(x,y+1) w(7)*a(x+1,y-1) w(8)*a(x+1,y) w(9)*a(x+1,y+1)];
         A1(x,y)=max(a1); %Dilation%
         A2(x,y)=min(a1); % Erosion%
    end
end
figure(1)
subplot(3,2,1)
imshow(a)
title('input image');
subplot(3,2,2)
imshow(d1)
title('Dilation with inbuilt function');
subplot(3,2,3)
imshow(d2)
title('Erosion with inbuilt function');
subplot(3,2,4)
imshow(A1)
title('Dilation ');
subplot(3,2,5)
imshow(A2)
title('Erosion ');
