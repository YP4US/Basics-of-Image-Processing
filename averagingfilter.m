%Yogesh Pawar
a=imread('C:\\Users\\Yogesh Pawar\\Downloads\\the-big-bang-theory-team.jpg');
% Addition of noise to the input image
b=imnoise(a,'salt & pepper');
c=imnoise(a,'gaussian');
d=imnoise(a,'speckle');
% Defining 3x3 and 5x5 kernel
h1=1/9*ones(3,3);
h2=1/25*ones(5,5);
% Attempt to recover the image
b1=conv2(b,h1,'same');
b2=conv2(b,h2,'same');
c1=conv2(c,h1,'same');
c2=conv2(c,h2,'same');
d1=conv2(d,h1,'same');
d2=conv2(d,h2,'same');
%Displaying the result
figure,subplot(2,2,1),imshow(a),title('Original Image'),
subplot(2,2,2),imshow(b),title('Salt & Pepper noise'),
subplot(2,2,3),imshow(uint8(b1)),title('3 x 3 Averaging filter'),
subplot(2,2,4),imshow(uint8(b2)),title('5 x 5 Averaging filter')
%...........................
figure,subplot(2,2,1),imshow(a),title('Original Image'),
subplot(2,2,2),imshow(c),title('Gaussian noise'),
subplot(2,2,3),imshow(uint8(c1)),title('3 x 3 Averaging filter'),
subplot(2,2,4),imshow(uint8(c2)),title('5 x 5 Averaging filter'),
%..................
figure,subplot(2,2,1),imshow(a),title('Original Image'),
subplot(2,2,2),imshow(d),title('Speckle noise'),
subplot(2,2,3),imshow(uint8(d1)),title('3 x 3 Averaging filter'),
subplot(2,2,4),imshow(uint8(d2)),title('5 x 5 Averaging filter'),

