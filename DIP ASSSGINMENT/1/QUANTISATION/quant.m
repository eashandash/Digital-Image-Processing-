function newimage = quant(x,level)
[h,w]=size(x);
newimage = zeros(h,w,'uint8');

  for i = 1:h
     for j = 1:w
        newimage(i,j) = x(i,j)/(256/level);     
     end     
    end          
end




%{
x=imread('C:\Users\User\Desktop\lenaimage.jpg');
x;
imshow(x);

I7 = quant(x,128);
I6 = quant(x,64);
I5 =  quant(x,32);
I4 =  quant(x,16);
I3 =  quant(x,8);
I2 =  quant(x,4);
I1 =  quant(x,2);
subplot(4,2,1);imshow(I7,[0,127]);title('128L');
subplot(4,2,2);imshow(I6,[0,63]);title('64L');
subplot(4,2,3);imshow(I5,[0,31]);title('32L');
subplot(4,2,4);imshow(I4,[0,15]);title('16L');
subplot(4,2,5);imshow(I3,[0,7]);title('8L');
subplot(4,2,6);imshow(I2,[0,3]);title('4L');
subplot(4,2,7);imshow(I1,[0,1]);title('2L');
%}