function [B, A_k] = root_subspace_basis(A, fid)
    X = charpoly(A);
    if X(end) ~= 0
        if nargin < 2
            disp("A is a nondegenerate matrix");
        else
            fprintf(fid, "A is a nondegenerate matrix\n");
        end
        B = [];
        A_k = [];
        return;
    end
    for i = 0:(width(X) - 1)
        if X(width(X) - i) ~= 0
            k = i;
        end
    end
    A_k = A^k;
    B = sym(null(A^k));
end