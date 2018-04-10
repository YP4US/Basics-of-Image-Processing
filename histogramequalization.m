%Yogesh Pawar
a=imread('C:\\Users\\Yogesh Pawar\\Documents\\MATLAB\\IP algorithms\\IP algorithms\\dark.jpg');
%perform histogram equalization
b=histeq(a);
subplot(2,2,1),imshow(a),title('original image'),
subplot(2,2,2),imshow(b),title('After histogram equalization'),
subplot(2,2,3),imhist(a),title('original histogram')
subplot(2,2,4),imhist(b),title('After histogram equalization')
