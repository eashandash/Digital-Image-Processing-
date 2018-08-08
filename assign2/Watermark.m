function [X,Y,Ym,W,ExW,c] = Watermark(k,alpha)
%{
[x,y,m,w,exw,c] = Watermark(1000,0.1);

X ---- original image
Y ---- Watermarked image
Ym --- Manipulated image
W --- Inserted Watermark
ExW --- Extracted Watermak
c ---- Correlation value 
%}
    
%INSERTION OF WATERMARK

X = imread('../Lena.jpg');
[h,w] = size(X);
%apply discrete cosine transform
X1 = dct2(X);
%transpose the matrix
X2 = X1.';
%linearize the matrix taking each row as a block
x = reshape(X2, 1, []);
y = zeros(1,length(x));
%copy x into y
y = x;
%identify K = 1000 max and their positions
[K,Kpos] = MaxK(x,k);
%Watermark which is normally distributed with mean = 0 and variance = 1
W = randn(1,k);
%transparency
alpha = 0.1;
%update the k largest elements
for i = 1:k
    y(Kpos(i)) = x(Kpos(i))*(1+(alpha*W(i)));
end
%reshape the vector to matrix
Y1 = reshape(y,[h,w]);
%take the transpose
Y2 = Y1.';
%apply inverse discrete cosine transform
Y = uint8(idct2(Y2));

%MANIPULATION OF IMAGE
Ym = imnoise(Y,'speckle',0.02);

%EXTRACTION OF WATERMARK
%apply discrete cosine transform
Ym1 = dct2(Ym);
%transpose the matrix
Ym2 = Ym1.';
%linearize the matrix taking each row as a block
ym = reshape(Ym2, 1, []);
ExW = zeros(1,k);
for i = 1:k
    ExW(i) = ((ym(Kpos(i))/x(Kpos(i)))-1)/alpha;
end
c = corr2(W,ExW);
end