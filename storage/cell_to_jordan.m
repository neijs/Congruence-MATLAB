function T = cell_to_jordan(A, start_i, start_j, lead_i)
    dimT = lead_i - start_i;
    T = sym(zeros(dimT));
    T(1, 1) = 1;
    for k = 2:dimT
        if A(start_i + k - 2, start_j + k - 2) ~= 0
            T(k, k) = 1 / (A(start_i + k - 2, start_j + k - 2)*(T(k - 1, k - 1))');
        end
    end
end