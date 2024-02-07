function [A, Super, m] = Lemma5(A, Super, m, i)
    % Step 1
    disp("Step 1 of Lemma 5");
    dimA = length(A);
    rho = rho_i(i, m, dimA);
    A_i = A(1:rho, 1:rho);
    [A_i, S, m(2*i+1), m(2*i+2)] = Lemma3(A_i);
    next_rho = rho_i(i+1, m, dimA);
    [~, S] = Lemma4(A_i, S, next_rho, m(2*i+1), m(2*i+2));
    S_capped = sym(blkdiag(S, eye(dimA - length(S))));
    A = S_capped*A*S_capped';
    disp(A);
    Super = S_capped*Super;

    % Step 2. Removing B1 and B2 blocks ADEMAS restoring everything up
    disp("Step 2 of Lemma 5");
    for j = i:-1:1
        M    = A(1:rho_i(j+1,m,dimA)+m(2*j+2), 1:rho_i(j,m,dimA));
        B1B2 = A(1:rho_i(j+1,m,dimA)+m(2*j+2), rho_i(j,m,dimA)+1:rho_i(j,m,dimA)+m(2*j));
        [X, ~] = linsolve(M, B1B2);
        S = sym(eye(dimA));
        S(1:rho_i(j,m,dimA), rho_i(j,m,dimA)+1:rho_i(j,m,dimA)+m(2*j)) = (-1)*X;
        A = S'*A*S;
        Super = S'*Super;
        disp(A);
        Spoiled = A(rho_i(j,m,dimA)+1:rho_i(j,m,dimA)+m(2*j), 1:rho_i(j,m,dimA)+m(2*j));
        X = sym(zeros(m(2*j-1), rho_i(j,m,dimA)+m(2*j)));
        X(1:m(2*j), :) = Spoiled;
        S = sym(eye(dimA));
        S(rho_i(j,m,dimA)+m(2*j)+1:rho_i(j,m,dimA)+m(2*j)+m(2*j-1), 1:rho_i(j,m,dimA)+m(2*j)) = (-1)*X;
        A = S'*A*S;
        Super = S'*Super;
        disp(A);
    end

    % Step 3. A) Remove B3
    disp("Step 3.A) of Lemma 5");
    B3 = A(next_rho+m(2*i+2)+1:rho, rho+1:rho+m(2*i));

    % new staff
    idx = move_left_indep_c(B3);
    V = sym(eye(width(idx)));
    V = V(:, idx);
    S = sym(blkdiag(eye(rho), V, eye(dimA - rho - length(V))));
    A = S'*A*S;
    disp("displaying A after P");
    disp(A);
    Super = S'*Super;
    B3 = A(next_rho+m(2*i+2)+1:rho, rho+1:rho+m(2*i));
    % New restoration
    for k = 2*i-1:-1:1
        V = sym(blkdiag(inv(V'), eye(m(k)-m(k+1))));
        IR = sym(eye(sum(m(:, 1:k-1))));
        S = sym(blkdiag(eye(dimA - length(IR) - length(V)), V, IR));
        A = S'*A*S;
        Super = S'*Super;
    end
    % new staff

    V = to_IO(B3);
    S = sym(blkdiag(eye(rho), V, eye(dimA - rho - length(V))));
    A = S'*A*S;
    Super = S'*Super;
    disp(A);

    % Step 3. B) Restore the standart form
    disp("Step 3.B) of Lemma 5"); 
    for k = 2*i-1:-1:1
        V = sym(blkdiag(inv(V'), eye(m(k)-m(k+1))));
        IR = sym(eye(sum(m(:, 1:k-1))));
        S = sym(blkdiag(eye(dimA - length(IR) - length(V)), V, IR));
        A = S'*A*S;
        Super = S'*Super;
    end
    disp(A);
end