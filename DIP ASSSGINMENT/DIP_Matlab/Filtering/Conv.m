function FImg = Conv(Img, Filter)
    Filter = double(Filter);
    Img = double(Img);
    Filter = rot90(Filter,2);
    [fh, fw] = size(Filter);
    [Ih, Iw] = size(Img);
    FImg = zeros(Iw, Ih);
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
            FImg(i,j) = sum;
        end
    end
end
%{
WF = [[1,2,1];[2,4,2];[1,2,1]];
LF = [[0,1,0];[1,-4,1];[0,1,0]];
ILF = [[0,-1,0];[-1,4,-1];[0,-1,0]];
PF = [[1,1,1];[0,0,0];[-1,-1,-1]];
IPF = [[1,0,-1];[1,0,-1];[1,0,-1]];
RF = [[1,0];[0,-1]];
RF = [[1,0,0];[0,-1,0];[0,0,0]];
IRF = [[0,1];[-1,0]];
IRF = [[0,1,0];[-1,0,0];[0,0,0]];
SF = [[1,2,1];[0,0,0];[-1,-2,-1]];
MAT5 = [[1,2,3,2,1];[4,5,6,5,4];[7,8,9,8,7];[10,11,12,11,10];[13,14,15,14,13]];
MAT3 = [[1,2,3];[4,5,6];[7,8,9]];
%}