function B = root_subspace_intersection(A, fid)
    [~, A_k] = root_subspace_basis(A);
    disp("Displaying A^k");
    disp(A_k);
    [~, A_star_k] = root_subspace_basis(A');
    disp("Displaying A^k star");
    disp(A_star_k);
    B = null([A_k; A_star_k]);
    if isempty(B)
        if nargin < 2
            disp("Intersection consists only of 0");
        else 
            fprintf(fid, "Intersection consists only of 0\n");
        end
        return;
    end
end