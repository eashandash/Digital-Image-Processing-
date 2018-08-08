function F = OneD_DFT(f)
    f = double(f);
    N = length(f);
    F = zeros(1,N);
    for u = 1:(N)
        for x = 1:(N)
            F(u) = F(u) + f(x)*exp(1i*(-2)*pi*(u-1)*(x-1)/N);
        end
    end
end