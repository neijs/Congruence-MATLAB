function A = complex_conceal(A_base, src)
    dim = length(A_base);
    while true
        rng("shuffle");
        reQ = sym(randi([-src, src],dim));
        rng("shuffle");
        imQ = sym(randi([-src, src],dim)*1i);
        Q = reQ + imQ;
        if det(Q) ~= 0
            break;
        end
    end
    fprintf("Concealed matrix with matrix Q: detQ = %d\n", det(Q));
    disp(Q);
    A = sym(Q'*A_base*Q);
end