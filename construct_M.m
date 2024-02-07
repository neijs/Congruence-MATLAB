function M = construct_M(m)
     M = sym([]);
     for i = 1:length(m)
        if i == length(m)
            M = sym(blkdiag(M, J_i_brackets(i, m(i))));
        else
            M = sym(blkdiag(M, J_i_brackets(i, m(i)-m(i+1))));
        end
     end
end