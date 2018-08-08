function FImg = filtering(Img, Filter)
    [fh, fw] = size(Filter);
    [Ih, Iw] = size(Img);
    FImg = zeros(Iw, Ih, 'uint8');
    sum_filter = 0;
    midpoint = ceil(fh/2);
    for i = 1:fw
        for j = 1:fh
            sum_filter = sum_filter + Filter(i, j);
        end
    end
    for i = 1:Iw
        for j = 1:Ih
            sum = 0;
            for k = -floor(fh/2):floor(fh/2)
                for l = -floor(fh/2):floor(fh/2)
                    if(i+k<1 || j+l<1 || i+k>Iw || j+l>Iw)
                        sum = sum + 0;
                    else
                        sum = sum + (Filter(midpoint+k, midpoint+l) * Img(i+k, j+l));
                    end
                end
            end
            FImg(i,j) = sum/sum_filter;
        end
    end
end