%Yogesh Pawar
a=imread('C:\\Users\\Yogesh Pawar\\Documents\\MATLAB\\IP algorithms\\IP algorithms\\lenna.jpg');
[m n]=size(a);
n1=input('enter the bitplane No (8,7,6,5,4,3,2,1) that to be removed');
s=255-(2^(n1-1));
for i=1:m,
for j=1:n,
Out_I(i,j)=bitand(a(i,j),s);
end
end
figure,imshow(uint8(Out_I));
        
