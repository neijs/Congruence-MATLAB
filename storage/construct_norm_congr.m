% Additional congruence with a diagonal transform matrix
function D = construct_norm_congr(A, start_i, start_j, lead_i)
    T = cell_to_jordan(A, start_i, start_j, lead_i);
    dimA = length(A);
    dimE_f = start_i - 1;
    dimT = length(T);
    E_f = sym(eye(dimE_f));
    E_r = sym(eye(dimA - dimE_f - dimT));
    D = sym(blkdiag(E_f, T, E_r));
end