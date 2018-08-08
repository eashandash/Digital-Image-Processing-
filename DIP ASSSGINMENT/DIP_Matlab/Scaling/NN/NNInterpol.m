function N = NNInterpol(Img, DecI , DecJ)
    y1 = floor(DecJ);
    x1 = floor(DecI);
    y2 = ceil(DecJ);
    x2 = ceil(DecI);
    Sy2y1 = y2 - y1;
    Sy2y = y2 - DecJ;
    Syy1 = DecJ - y1;
    Sx2x1 = x2 - x1;
    Sx2x = x2 - DecI;
    Sxx1 = DecI - x1;
    if(y1 == 0)
        y1 = 1;
    end
    if(x1 == 0)
        x1 = 1;
    end
    if ((x1 == x2) && (y1 == y2)) 
        N = Img(x1,y1);
    elseif (Sxx1>Sx2x)
        if(Syy1> Sy2y)
            N = Img(x2, y2);
        else
            N = Img(x2, y1);
        end
    else
        if(Syy1>Sy2y)
            N = Img(x1, y2);
        else
            N = Img(x1, y1);
        end
    end
end