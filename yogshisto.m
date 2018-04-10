%Yogesh Pawar
I = imread('C:\\Users\\Yogesh Pawar\\Documents\\MATLAB\\IP algorithms\\IP algorithms\\lenna.jpg');
imhist(I);
J = histeq(I);
figure
subplot(1,2,1);
imshow(J);
subplot(1,2,2);
imhist(J,64);