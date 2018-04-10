%Yogesh Pawar
boxImage = imread('C:\\Users\\Yogesh Pawar\\Documents\\MATLAB\1.png');
figure;
imshow(boxImage);
title('Image of a jhon');

sceneImage = imread('C:\\Users\\Yogesh Pawar\\Documents\\MATLAB\2.png');
figure;
imshow(sceneImage);
title('Image of a jhons familly');


boxPoints = detectSURFFeatures(boxImage);
scenePoints = detectSURFFeatures(sceneImage);


figure;
imshow(boxImage);
title('100 Strongest Feature Points from Box Image');
hold on;
plot(selectStrongest(boxPoints,15));
