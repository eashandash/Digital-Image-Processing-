function l = BilinearInterpol(Img, DecI, DecJ)
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
        l = Img(x1,y1);
    elseif(x1 == x2)
        l = floor(((Sy2y*Img(x1,y1))+(Syy1*Img(x1,y2)))/Sy2y1);
    elseif(y1 == y2)
        l = floor(((Sx2x*Img(x1,y1))+(Sxx1*Img(x2,y1)))/Sx2x1);
    else
        l = floor(((Sx2x*Sy2y*Img(x1,y1))+(Sxx1*Sy2y*Img(x2,y1))+(Sx2x*Syy1*Img(x1,y2))+(Sxx1*Syy1*Img(x2,y2)))/(Sx2x1*Sy2y1));
    end                 
end