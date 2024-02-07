function A = change_leading_element(A, i, j)
    [~, I] = max(abs(A(i, :)));
    I = I(1);
    A(:, [j, I]) = A(:, [I, j]);
    A([j, I], :) = A([I, j], :);
end
