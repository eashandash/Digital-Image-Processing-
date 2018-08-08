function HImg = HMatch(Img,Img_ref)
    [h,w] = size(Img);
    [HImg,output1] = HEq(Img);
    [HImg_ref,output2] = HEq(Img_ref);
    output = zeros(256,1);
    for i=1:256
        temp = 9999;
        for j=1:256
            diff = abs(output2(j)-output1(i));
            if(diff < temp)
                temp = diff;
                minpos = j;
            end
        end
        output(i) = minpos;
    end
    for i = 1:h
        for j = 1:w
            HImg(i,j) = output(Img(i,j)+1);
        end
    end
end
