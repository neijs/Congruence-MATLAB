function idx = move_left_indep_c(X)
    [~, ~, E] = qr(X, "econ", "vector"); 
    disp(E);
    r = rank(X);
    idx = [sort(E(1:r)), E(r+1:end)];
end