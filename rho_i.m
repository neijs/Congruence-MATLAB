function rh = rho_i(i, m, dimA)
    rh = dimA - sum(m(1:2*i));
end