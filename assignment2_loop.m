% Initial guesses
u_initial_matrix = [1 1 pi/3 1; 0.5 0.5 pi/3 -0.5; -1 -1 -pi/3 -1];
u_result_matrix = zeros(size(u_initial_matrix));
constants = [1 1 2 1; 1 1 1 10; 1 2 1 1];

for i = 1:4
u_vector = u_initial_matrix(:,i);
constant_vector = constants(:,i);

% The Jacobian Matrix
J = jac_matrix(u_vector, constant_vector);

% Vector with the results from the three functions
func_vector = function_vector_matrix(u_vector, constant_vector);

% J\func_vector is the same as inv_jacobian * function_vector
u_next_vector = u_vector - J\func_vector;

while abs(sum(u_vector - u_next_vector)) > 10^(-3)
    u_vector = u_next_vector;
    
    J = jac_matrix(u_vector, constant_vector);
    
    func_vector = function_vector_matrix(u_vector, constant_vector);

    u_next_vector = u_vector - J\func_vector;
end

u_vector = u_next_vector;
u_1 = u_vector(1);
u_2 = u_vector(2);
u_3 = u_vector(3);

u_result_matrix(1,i) = u_1;
u_result_matrix(2,i) = u_2;
u_result_matrix(3,i) = u_3;


Ax = 0;
Ay = 0;
Bx = 2;
By = 0;
m1x = cos(abs(u_1)); 
m1y = -sin(abs(u_1));
m2x = Bx - constant_vector(1)*cos(abs(u_3));
m2y = By - constant_vector(1)*sin(abs(u_3));

x = [Ax m1x m2x Bx Ax];
y = [Ay m1y m2y By Ay];
figure(i);
plot(x, y);


end
u_result_matrix