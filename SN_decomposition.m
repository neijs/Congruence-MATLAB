function [A, Super] = SN_decomposition(A)
    dimA = length(A);
    iter = 1;
    m = zeros(1, 2*dimA);
    [A, Super, m(1), m(2)] = Lemma3(A);
    rho = rho_i(iter, m, dimA);
    [A, Super] = Lemma4(A, Super, rho, m(1), m(2));
    terminated = false;
    while ~terminated
        [A, Super, m, terminated] = forward(A, Super, m, iter);
        iter = iter + 1;
    end
    m = m(:, 1:2*iter);
    disp(m);
    Sm = NtoM(m);
    addit_super = sym(blkdiag(eye(dimA - sum(m)), Sm));
    A = addit_super * A * addit_super';
    Super = addit_super*Super;
end