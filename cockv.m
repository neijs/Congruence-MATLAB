M = sym([32 -10; -6 2]);
N = sym([2 3; 1 2]);

Cm = M'\M;
Cn = N'\N;

disp(Cm);
disp(Cn);