sum = 0;
for x = 0:6
    for y = 0:6
        for z = 0:6
            lhs = lindon(lindon(x,y), z);
            rhs = x;
            if lhs == rhs
                sum = sum + 1;
            end
        end
    end
end
disp(sum);