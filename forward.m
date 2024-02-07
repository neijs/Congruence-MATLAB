function [A, Super, m, terminated] = forward(A, Super, m, i)
    rho = rho_i(i, m, length(A));
    if rho == 0
        disp("Case 1");
        terminated = true;
        return;
    end
    A_i = A(1:rho, 1:rho);
    %fprintf("Displaying A_%d from forward\n", i);
    %disp(A_i);
    if det(A_i) ~= 0
        disp("Case 3");
        [A, Super, m] = Case3(A, Super, m, i);
        terminated = true;
        return;
    end
    if ~any(A_i)
        disp("Case 2");
        [A, Super, m] = Case2(A, Super, m, i);
        terminated = true;
        return;
    end
    disp("Case 4 (Lemma 5)");
    [A, Super, m] = Lemma5(A, Super, m, i);
    terminated = false;
end