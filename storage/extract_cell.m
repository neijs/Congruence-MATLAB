function [A, lead_i, lead_j] = extract_cell(A, lead_i, lead_j)
    disp("Displaying A before basis congruation");
    disp(A);
    B = construct_basis_congr(A, lead_i, lead_j);
    A = (B')*A*(B);
    disp("Displaying A after basis congruation");
    disp(A);
    start_i = lead_i; start_j = lead_j;
    disp("Displaying lead_i and lead_j before excl_step");
    fprintf('%d, %d\n', lead_i, lead_j);
    while lead_j <= length(A)
        if any(A(lead_i, :))
            A = exclusion_step(A, lead_i, lead_j);
            lead_i = lead_i + 1; lead_j = lead_j + 1;
        else
            break;
        end
    end
    lead_i = lead_i + 1; lead_j = lead_j + 1;
    disp("Displaying lead_i, lead_j after excl_step");
    fprintf('%d, %d\n', lead_i, lead_j);
    disp("Displaying cell before normalization");
    disp(A((start_i):(lead_i - 1), (start_j - 1):(lead_j - 2)));
    D = construct_norm_congr(A, start_i, start_j, lead_i);
    A = (D')*A*(D);
    disp("Extracted cell");
    disp(A((start_i):(lead_i - 1), (start_j - 1):(lead_j - 2)));
end