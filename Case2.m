function [A, Super, m] = Case2(A, Super, m, i)
    dimA = length(A);
    rho = rho_i(i, m, length(A));
    m(2*i+1) = rho;
    B = A(1:rho, rho+1:rho+m(2*i));

    % new staff
    idx = move_left_indep_c(B);
    V = sym(eye(width(idx)));
    V = V(:, idx);
    S = sym(blkdiag(eye(rho), V, eye(dimA - rho - length(V))));
    A = S'*A*S;
    disp("displaying A after P");
    disp(A);
    Super = S'*Super;

    B = A(1:rho, rho+1:rho+m(2*i));
    for k = 2*i-1:-1:1
        V = sym(blkdiag(inv(V'), eye(m(k)-m(k+1))));
        IR = sym(eye(sum(m(:, 1:k-1))));
        S = sym(blkdiag(eye(dimA - length(IR) - length(V)), V, IR));
        A = S'*A*S;
        Super = S'*Super;
    end
    % new staff

    V = to_IO(B);
    S = sym(blkdiag(eye(rho), V, eye(dimA - rho - length(V))));
    A = S'*A*S;
    %disp(A);
    Super = S'*Super;
    Ileft = m(2*i+1) + m(2*i);
    for j = 2*i-1:-1:1
        V = sym(blkdiag(inv(V'), eye(m(j)-m(j+1))));
        S = sym(blkdiag(eye(Ileft), V, eye(dimA - length(V)- Ileft)));
        Ileft = Ileft + length(V);
        A = S'*A*S;
        disp(A);
        Super = S'*Super;
        %disp(A);
    end
end