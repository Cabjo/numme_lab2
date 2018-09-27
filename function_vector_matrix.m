function vector = function_vector_matrix(u_vector, constant_vector)
f = cos(u_vector(1)) + cos(u_vector(2)) + constant_vector(1) * cos(u_vector(3)) - 2;
g = sin(u_vector(1)) + sin(u_vector(2)) + constant_vector(1) * sin(u_vector(3));
h = constant_vector(3)*tan(u_vector(1)) - (constant_vector(2) + constant_vector(3))*tan(u_vector(2)) + constant_vector(2)*tan(u_vector(3));
vector = [f g h]';
end

