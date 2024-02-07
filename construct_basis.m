function B = construct_basis(vectors, mode)
    if nargin < 2, mode = "front"; end
    dim = height(vectors);
    if mode == "front"
        X = sym([vectors(:, 1).'; eye(dim)]);
    elseif mode == "back"
        X = sym([eye(dim); vectors.']);
    else 
        disp("Invalid mode in construct_basis.");
        return;
    end    
    X = X.';
    [~, ~, E] = qr(X, "econ", "vector"); 
    r = rank(X);
    idx = sort(E(1:r));
    B = X(:, idx);
end