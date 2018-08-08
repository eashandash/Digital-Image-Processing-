function Simg = Sampling(Img,factor)
    [h,w] = size(Img);
    Simg = zeros(ceil(h/factor),ceil(w/factor),'uint8');
    m = 1;
    n = 1;
    for i = 1:factor:h
        for j = 1:factor:w
            Simg(m,n) = Img(i,j);
            n = n + 1;
        end
        m = m + 1;
        n = 1;
    end          
end