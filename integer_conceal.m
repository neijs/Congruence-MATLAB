function A = integer_conceal(A_base, src)
    dim = length(A_base);
    while true
        rng("shuffle");
        Q = sym(randi([-src,src],dim));
        if det(Q) ~= 0
            break;
        end
    end
    fprintf("Concealed matrix with matrix Q: detQ = %d\n", det(Q));
    disp(Q);
    A = sym(Q'*A_base*Q);
end