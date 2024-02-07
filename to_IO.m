function V = to_IO(E)
    h = height(E);
    w = width(E);
    % for j = 1:w-h+1
    %     Es = E(:, j:j+h-1);
    %     if det(Es) ~= 0
    %         idx = [j:w, 1:j-1];
    %         P = sym(eye(w));
    %         Per = P(:, idx);
    %         break;
    %     end
    % end
    %E = E*Per;
    Es = E(:, 1:h);
    Er = E(:, h+1:end);
    Es_inv = inv(Es);
    % V = Per*[Es_inv, -Es_inv*Er; zeros(w-h, h), eye(w-h)];
    V = [Es_inv, -Es_inv*Er; zeros(w-h, h), eye(w-h)];
end