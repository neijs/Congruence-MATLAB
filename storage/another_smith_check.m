syms lambda;
J = sym(blkdiag([0 1; 0 0], 1));
disp(J);
J_lambda = J - lambda*transpose(J);
disp(J_lambda);
[S_j, a, b] = MNsmithForm(J_lambda);
disp(S_j);