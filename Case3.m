function [A, Super, m] = Case3(A, Super, m, i)
    dimA = length(A);
    rho = rho_i(i, m, length(A));
    A_i = A(1:rho, 1:rho);
    B = A(1:rho, rho+1:rho+m(2*i));
    S_capped = sym([eye(rho), (-1)*(A_i\B); zeros(m(2*i), rho), eye(m(2*i))]);
    S = sym(blkdiag(S_capped, eye(dimA - length(S_capped))));
    A = S'*A*S;
    Super = S'*Super;
    [A, Super] = Lemma4(A, Super, rho, m(2*i-1), m(2*i));
    for j = i:-1:1
        M    = A(1:rho_i(j+1,m,dimA)+m(2*j+2), 1:rho_i(j,m,dimA));
        B1B2 = A(1:rho_i(j+1,m,dimA)+m(2*j+2), rho_i(j,m,dimA)+1:rho_i(j,m,dimA)+m(2*j));
        [X, ~] = linsolve(M, B1B2);
        S = sym(eye(dimA));
        S(1:rho_i(j,m,dimA), rho_i(j,m,dimA)+1:rho_i(j,m,dimA)+m(2*j)) = (-1)*X;
        A = S'*A*S;
        Super = S'*Super;
        %disp(A);
        Spoiled = A(rho_i(j,m,dimA)+1:rho_i(j,m,dimA)+m(2*j), 1:rho_i(j,m,dimA)+m(2*j));
        X = sym(zeros(m(2*j-1), rho_i(j,m,dimA)+m(2*j)));
        X(1:m(2*j), :) = Spoiled;
        S = sym(eye(dimA));
        S(rho_i(j,m,dimA)+m(2*j)+1:rho_i(j,m,dimA)+m(2*j)+m(2*j-1), 1:rho_i(j,m,dimA)+m(2*j)) = (-1)*X;
        A = S'*A*S;
        Super = S'*Super;
        %disp(A);
    end
end