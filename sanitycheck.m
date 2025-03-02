syms pi
A = sym([1, -(pi), (pi)^2, -(pi)^3, (pi)^4;
         1, -(pi)/2, (pi)^2/4, -(pi)^3/8, (pi)^4/16;
         1, 0, 0, 0, 0;
         1, (pi)/2, (pi)^2/4, (pi)^3/8, (pi)^4/16;
         1, (pi), (pi)^2, (pi)^3, (pi)^4]);
disp(simplify(A))
C = sym([pi, pi^2])
b = sym([0; -1; 0; 1; 0]);
x = linsolve(A, b)