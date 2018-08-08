function f = OneD_IDFT(F)
    F = double(F);
    N = length(F);
    f = zeros(1,N);
    for x = 1:(N)
        for u = 1:(N)
            f(x) = f(x) + (1/N)*F(u)*exp(1i*(2)*pi*(u-1)*(x-1)/N);
        end
    end
end