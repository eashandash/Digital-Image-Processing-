function F = TwoD_DFT(f)
    [row,col] = size(f);
    F = zeros(row,col);
    for i = 1:row
        F(i,:) = OneD_DFT(f(i,:)); 
    end
    for i = 1:col
        F(:,i) = OneD_DFT(f(:,i)); 
    end       
end