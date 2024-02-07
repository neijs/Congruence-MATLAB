function [R, m2] = rref_congr_R(N)
    dimN = height(N);
    m2 = rank(N);
    P = move_up_indep_r(N);
    N = P*N;
    R = sym(eye(dimN));
    idx = [m2+1:dimN, 1:m2];
    F = R(idx, :);
    for i = (m2 + 1):dimN
        R(i, 1:m2) = (-1) * linsolve(N(1:m2, :).', N(i, :).');
    end
    R = F*R*P;
end