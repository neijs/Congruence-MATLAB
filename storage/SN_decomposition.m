function A = SN_decomposition(A)
    if det(A) ~= 0
        return;
    end
    lead_i = 1; lead_j = 2;
    while lead_j <= (length(A) + 1)
        [A, lead_i, lead_j] = extract_cell(A, lead_i, lead_j);
        R = A(lead_i:end, (lead_j - 1):end);
        if det(R) ~= 0
            break;
        end
    end
end
