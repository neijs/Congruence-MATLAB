function [A, SUPER] = SNM_decomposition(A)
    if det(A) ~= 0
        SUPER = sym(eye(length(A)));
        return;
    end
    decomposition_info(A);
    [A, Super, M] = SN_decomposition(A);
    disp("Displaying A from snm")
    disp(A);
    [~, addit_super] = SN_decomposition(M);
    disp("DISPLAYING ADDIT SUPER");
    disp(addit_super);
    addit_super = sym(blkdiag(eye(length(A) - length(M)), addit_super));
    SUPER = addit_super'*Super;
    A = addit_super'*A*addit_super;
end