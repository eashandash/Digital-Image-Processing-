function Gimg = GaussianFilter(Img,n,V)
    filter = zeros(n,n);
    x = -floor(n/2);
    y = x;
    for i = 1:n
        for j = 1:n
            filter(i,j) = (1/(2*pi*V))*exp(((x*x)+(y*y))/((-2)*V));
            y = y + 1;
        end
        y = -floor(n/2);
        x = x + 1;
    end   
    Gimg = filtering(Img,filter);
end
%{
Lena = imread('../Lena.jpg');
LenaSP = imnoise(Lena,'salt & pepper');
X = imgaussfilt(LenaSP,2);
%}