function A = exclusion_step(A, lead_i, lead_j)
    A = change_leading_element(A, lead_i, lead_j);
    if lead_i == 3 || lead_i == 4
        disp("Log A after change_leading_elem");
        disp(A);
    end
    leading_element = A(lead_i, lead_j);
    for j = (lead_j + 1) : length(A)
        alpha = sym(A(lead_i, j) / leading_element);
        if lead_j == 5
            disp("Displaying alpha");
            disp(alpha);
        end
        A(:, j) = A(:, j) - alpha * A(:, lead_j);
        A(j, :) = A(j, :) - (alpha') * A(lead_j, :); 
    end
    if lead_i == 3 || lead_i == 4
        disp("Log A after row exclusion");
        disp(A);
    end
    for i = (lead_i + 1) : length(A)
        beta = sym(A(i, lead_j) / leading_element);
        A(i, :) = A(i, :) - beta * A(lead_i, :);
        A(:, i) = A(:, i) - (beta') * A(:, lead_i);
        if lead_j == 5
            disp("Log stolbcbl blya");
            disp(i);
            disp(A(i, :));
            disp(A(:, i));
        end
    end
    if lead_i == 3 || lead_i == 4
        disp("Log A after col exclusion");
        disp(A);
    end
end