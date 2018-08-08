function C = X(img,angle)
    [rows,cols]= size(img);  

    Rows = ceil(rows*abs(cosd(angle))+cols*abs(sind(angle)));                      
    Cols = ceil(rows*abs(sind(angle))+cols*abs(cosd(angle)));                     

    C = uint8(zeros([Rows Cols]));

    Xo = ceil(rows/2);                                                            
    Yo = ceil(cols/2);

    midx = ceil(Rows/2);
    midy = ceil(Cols/2);

    for i=1:Rows
        for j=1:Cols                                                      
             x = (i-midx)*cosd(angle)+(j-midy)*sind(angle);                                       
             y = -(i-midx)*sind(angle)+(j-midy)*cosd(angle);                             
             x = round(x)+Xo;
             y = round(y)+Yo;
             if (x >= 1 && y >= 1 && x <= rows &&  y <= cols) 
                  C(i,j)=img(x,y);  
             end
        end
    end
end