function B = construct_basis_congr(A, lead_i, lead_j)
    R = A(lead_i:end, (lead_j - 1):end);
    dimA = length(A);
    dimR = length(R);
    kerR = null(R);
    T = construct_basis(kerR(:, 1));
    E = sym(eye(dimA - dimR));
    B = sym(blkdiag(E, T));
end