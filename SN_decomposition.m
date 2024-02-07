function [A, Super, M] = SN_decomposition(A)
    if det(A) ~= 0
        Super = sym(eye(length(A)));
        return;
    end
    dimA = length(A);
    decomposition_info(A);
    iter = 1;
    m = zeros(1, 2*length(A));
    [A, Super, m(1), m(2)] = Lemma3(A);
    rho = rho_i(iter, m, dimA);
    [A, Super] = Lemma4(A, Super, rho, m(1), m(2));
    terminated = false;
    while ~terminated
        [A, Super, m, terminated] = forward(A, Super, m, iter);
        iter = iter + 1;
    end
    m = m(:, 1:2*iter);
    disp("displaying m from sn");
    disp(m);
    M = construct_M(m(:, 1:2*iter));
    disp("displaying M from sn");
    disp(M);
end