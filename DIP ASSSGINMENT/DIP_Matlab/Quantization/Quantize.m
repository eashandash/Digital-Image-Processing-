function Qimg = Quantize(Img,Newlevels)
    [h,w] = size(Img);
    l = class(Img);
    l = l(5:length(l));
    OldLevels = str2num(l);
    Qimg = zeros(h,w,'uint8');
    k = power(2,OldLevels)/Newlevels;
    for i = 1:h
        for j = 1:w
            Qimg(i,j) = floor(Img(i,j)/k);
        end
    end         
end
%{
Lena = imread('C:\Users\Leela Krishna\Desktop\DIP_Matlab\Sampling\Lena.jpg');
I7 = Quantize(Lena,128);
I6 = Quantize(Lena,64);
I5 = Quantize(Lena,32);
I4 = Quantize(Lena,16);
I3 = Quantize(Lena,8);
I2 = Quantize(Lena,4);
I1 = Quantize(Lena,2);
subplot(3,3,2);imshow(I7,[0,127]);title('128L');
subplot(3,3,3);imshow(I6,[0,63]);title('64L');
subplot(3,3,4);imshow(I5,[0,31]);title('32L');
subplot(3,3,5);imshow(I4,[0,15]);title('16L');
subplot(3,3,6);imshow(I3,[0,7]);title('8L');
subplot(3,3,7);imshow(I2,[0,3]);title('4L');
subplot(3,3,8);imshow(I1,[0,1]);title('2L');
%}