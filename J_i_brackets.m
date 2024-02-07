function Jib = J_i_brackets(i, n)
    Jib = sym([]);
    if n == 0
        return;
    end
    J = Jn(i);
    for j = 1:n
        Jib = sym(blkdiag(Jib, J));
    end
end