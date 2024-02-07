function P = move_up_indep_r(X)
    X = X.';
    [~, ~, E] = qr(X, "econ", "vector"); 
    r = rank(X);
    idx = [sort(E(1:r)), E(r+1:end)];
    P = sym(eye(width(X)));
    P = P(:, idx);
    P = P.';
end