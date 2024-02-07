function [A, Super, m1, m2] = Lemma3(A)
    dimA = length(A);

    % Stage 1
    disp("Stage 1");
    [S, m1] = rref_congr_S(A);
    A = S*A*S';
    disp(A);

    % Stage 2
    disp("Stage 2");
    N = A(1:dimA-m1, dimA-m1+1:end);
    [R, m2] = rref_congr_R(N);
    RI = sym(blkdiag(R, eye(m1)));
    A = RI*A*RI';
    Super = RI*S;
    disp(A);
end