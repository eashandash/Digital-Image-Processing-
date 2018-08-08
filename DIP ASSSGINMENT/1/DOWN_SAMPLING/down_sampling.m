function newimage = down_sampling(x,factor)
[h,w]=size(x);
newimage = zeros(ceil(h/factor),ceil(w/factor),'uint8');
m = 1;
n = 1;
  for i = 1:factor:h
     for j = 1:factor:w
        newimage(m,n) = x(i,j);
            n = n + 1;
        end
        m = m + 1;
        n = 1;
    end          
end
