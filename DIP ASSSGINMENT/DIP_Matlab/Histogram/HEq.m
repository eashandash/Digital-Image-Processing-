function [HImg,output] = HEq(Img)
    [h,w] = size(Img);
    numOfPixels = h*w;
    HImg = zeros(h,w,'uint8');
    freq = zeros(256,1);
    prob_freq = zeros(256,1);
    cum_prob_freq = zeros(256,1);
    output = zeros(256,1);
    
    for i = 1:h
        for j = 1:w
            value = Img(i,j);
            freq(value+1) = freq(value+1)+1;
        end
    end
    for i = 1:256
        prob_freq(i) = freq(i)/numOfPixels;
    end
    
    sum=0;
    
    for i=1:256
       sum = sum + prob_freq(i);
       cum_prob_freq(i) = sum;
       output(i) = round(cum_prob_freq(i)*255);
    end
    
    for i = 1:h
        for j = 1:w
            HImg(i,j) = output(Img(i,j)+1);
        end
    end
end
