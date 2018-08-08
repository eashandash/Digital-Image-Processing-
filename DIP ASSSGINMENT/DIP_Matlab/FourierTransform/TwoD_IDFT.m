function f = TwoD_IDFT(F)
    [row,col] = size(F);
    f = zeros(row,col);
    for i = 1:row
        f(i,:) = OneD_IDFT(F(i,:)); 
    end
    for i = 1:col
        f(:,i) = OneD_IDFT(F(:,i)); 
    end       
end