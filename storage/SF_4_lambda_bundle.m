function [SF, SFdiag] = SF_4_lambda_bundle(A)
    syms lambda;
    SF = A - lambda*transpose(A);
    disp("Displaying SF");
    disp(SF);
    [SF, SFdiag, ~] = MNsmithForm(SF);
end