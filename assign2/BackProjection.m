function [a,out,out2] = BackProjection()
%[a,b,c]=BackProjection();
%a = imread('../Lena.jpg');
a = imread('circles.png');
a=double(a);
[r,c] = size(a);
out = double(zeros(r,c));

%ROW
for i=1:r
    sum = 0;
    for j=1:c
        sum = sum + a(i,j);
    end
    for j=1:c
        out(i,j) = out(i,j) + sum;
    end
end

%COLUMN
for i=1:c
    sum = 0;
    for j=1:r
        sum = sum + a(j,i);
    end
    for j=1:r
        out(j,i) = out(j,i) + sum;
    end
end
%LEFT RIGHT DIAGONAL 135deg
for i=1:r
    sum = 0;
    for j=i:-1:1
        sum = sum + a(j,i-j+1);
    end
    
    for j=i:-1:1
        out(j,i-j+1) = out(j,i-j+1) + sum;
    end
end

for i=2:r
    sum = 0;
    for j=r:-1:i
        sum = sum + a(j,i+r-j);
    end
    
    for j=r:-1:i
        out(j,i+r-j) = out(j,i+r-j) + sum;
    end
end

%LEFT RIGHT DIAGONAL 135deg

for i=1:r
    sum = 0;
    for j=i:-1:1
        sum = sum + a(r-j+1,i-j+1);
    end
    
    for j=i:-1:1
        out(r-j+1,i-j+1) = out(r-j+1,i-j+1) + sum;
    end
end

for i=2:r
    sum = 0;
    for j=r:-1:i
        sum = sum + a(r-j+1,i+r-j);
    end
    
    for j=r:-1:i
        out(r-j+1,i+r-j) = out(r-j+1,i+r-j) + sum;
    end
end
Min = min(min(out));
Max = max(max(out));
Range = Max - Min; 
out2 = zeros(r,c);
for i = 1:r
    for j = 1:c
        out2(i,j) = (out(i,j) - Min)/Range;
    end
end
out2 = out2*255;
out2 = uint8(out2);
end

