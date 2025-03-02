function Sm = NtoM(m)
    len = length(m);
    tmp = sym(zeros(len, m(1)));

    num = 1;
    for i = 1:len
        for mi = 1:m(len - i + 1)
            tmp(i, mi) = num;
            num = num + 1;
        end
    end
    tmp = tmp';
    disp(tmp);
    perm = [];
    first = 0;
    for i = len:-1:1
        cur = tmp(first+1:m(i), :);
        first = m(i);
        perm = [reshape(cur.',1,[]), perm];
    end
    disp(perm);
    perm(perm == 0) = [];
    Sm = sym(eye(sum(m)));
    Sm = Sm(perm, :);
end 