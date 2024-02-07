function F = kernel_intersection_detector(A)
    A_star = A';
    if det(A) ~= 0
        disp("Intersection of kernels = {0}, due to A being a nondegenerate matrix.");
        F = A;
        return;
    end
    U = [A; A_star];
    B = null(U);
    if isempty(B)
        disp("Intersection of kernels = {0}.");
        disp("There will be 0 cells of the order of 1 in SN-decomposition.");
        F = A;
        return;
    end
    if width(B) == 1
        fprintf('There will be %d cell of the order of 1 in SN-decomposition.\n', width(B));
    else
        fprintf('There will be %d cells of the order of 1 in SN-decomposition.\n', width(B));
    end
    T = construct_basis(B, "back");
    F = T'*A*T;
end