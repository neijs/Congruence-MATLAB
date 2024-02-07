function J = Jn_oplus_a(n, a)
    J_n = Jn(n);
    J = sym(blkdiag(J_n, sym(a)));
end