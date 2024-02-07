function [A, Super] = Lemma4(A, Super, rho, m1, m2)
    dimA = length(A);
    if m2 == 0
        return;
    end
    % E stage
    disp("E stage");
    E = A(rho+1:rho+m2, rho+m2+1:rho+m1+m2);
    disp("displaying E");
    disp(E);

    % new staff
    idx = move_left_indep_c(E);
    idx = idx + dimA - width(E);
    idx_new = [1:dimA-width(E), idx];
    P = sym(eye(dimA));
    P = P(:, idx_new);
    A = P'*A*P;
    Super = P'*Super;
    E = A(rho+1:rho+m2, rho+m2+1:rho+m1+m2);
    % new staff

    V = to_IO(E);
    VI = sym(blkdiag(eye(rho+m2), V, eye(dimA-rho-m2-m1)));
    A = VI'*A*VI;
    Super = VI'*Super;
    disp(A);

    % C D stage
    disp("C D stage");
    C = A(rho+1:rho+m2, 1:rho);
    D = A(rho+1:rho+m2, rho+1:rho+m2);
    X = (-1) * sym([C, D; zeros(m1-m2, rho+m2)]);
    S_capped = sym([eye(rho+m2), zeros(rho+m2, m1); X, eye(m1)]);
    S = sym(blkdiag(S_capped, eye(dimA-rho-m1-m2)));
    A = S'*A*S;
    Super = S'*Super;
    disp(A);
end