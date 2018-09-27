function J = jac_matrix(u_vector, constant_vector)
J = [-sin(u_vector(1)) -sin(u_vector(2)) -constant_vector(1)*sin(u_vector(3)); cos(u_vector(1)) cos(u_vector(2)) constant_vector(1)*cos(u_vector(3)); constant_vector(3)/cos(u_vector(1))^2 -(constant_vector(2) + constant_vector(3))/cos(u_vector(2))^2 constant_vector(2)/cos(u_vector(3))^2];
end

