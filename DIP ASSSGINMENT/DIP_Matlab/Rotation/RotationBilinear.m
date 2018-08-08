function Rimg = RotationBilinear(Img,Angle)
    [h,w] = size(Img);
    Rimg = zeros(h,w,'uint8');
    AngleMat = [[cosd(Angle),-sind(Angle),0];[sind(Angle),cosd(Angle),0];[0,0,1]];
    InvAngleMat = inv(AngleMat);
    for i = 1:h
        for j = 1:w
            DecI = i*InvAngleMat(1,1) + j*InvAngleMat(1,2) + InvAngleMat(1,3);
            DecJ = i*InvAngleMat(2,1) + j*InvAngleMat(2,2) + InvAngleMat(2,3);
            Rimg(i,j) = BilinearInterpol(Img,DecI,DecJ);               
        end
    end
end
