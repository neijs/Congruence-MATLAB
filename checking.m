warning("off")
A = sym([1, 2; 0 1]);
X = sym(blkdiag(A, Jn(3)));
X = integer_conceal(X, 3);
tic;
[Q, SUPER] = SNM_decomposition(X);
toc;
disp(Q);
disp(SUPER*X*SUPER');
quit();