function F = decomposition_info(A)
    defA = length(A) - rank(A);
    if defA == 1
        fprintf('There will be 1 cell in SN-decomposition.\n');
    else
        fprintf('There will be %d cells in SN-decomposition.\n', defA);
    end
    F = kernel_intersection_detector(A);
end