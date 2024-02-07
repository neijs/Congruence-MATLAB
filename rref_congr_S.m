function [S, m1] = rref_congr_S(A)
    dimA = length(A);
    k = rank(A);
    m1 = dimA - k;
    S = sym(eye(dimA));
    P = move_up_indep_r(A);
    A = P*A*P';
    for i = (k + 1):dimA
        S(i, 1:k) = (-1) * linsolve(A(1:k, :).', A(i, :).');
    end
    S = S*P;
end