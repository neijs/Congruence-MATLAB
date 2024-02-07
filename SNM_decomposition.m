function [A, SUPER] = SNM_decomposition(A)
    [A, Super, M] = SN_decomposition(A);
    disp("Displaying A from snm")
    disp(A);
    [~, addit_super] = SN_decomposition(M);
    addit_super = sym(blkdiag(eye(length(A) - length(M)), addit_super));
    SUPER = addit_super'*Super;
    A = addit_super'*A*addit_super;
end