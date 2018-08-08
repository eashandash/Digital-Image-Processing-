function Simg = BilinearScaling(Img,Hfactor,Wfactor)
    [h,w] = size(Img);
    Simg = zeros(h*Hfactor,w*Wfactor,'uint8');
    
    for i = 1:h*Hfactor
        for j = 1:w*Wfactor
            DecI = i/Hfactor;
            DecJ = j/Wfactor;
            Simg(i, j) = BilinearInterpol(Img, DecI, DecJ);
        end
    end         
end
