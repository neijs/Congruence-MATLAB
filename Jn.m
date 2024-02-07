function J_n = Jn(n)
    if n == 1
        J_n = 0;
        return;
    end
    c = sym(zeros(1, n));
    r = c;
    r(1, 2) = 1;
    J_n = sym(toeplitz(c, r));
end 