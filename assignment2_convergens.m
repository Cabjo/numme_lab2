clear all, close all, clc

% Initial guesses
u_initial_matrix = [1 1 pi/3 1; 0.5 0.5 pi/3 -0.5; -1 -1 -pi/3 -1];
u_result = zeros(3,1);
constants = [1 1 2 1; 1 1 1 10; 1 2 1 1];

% To calculate the order of convergence 
iterations_u_1 = zeros(10, 1);
iterations_u_2 = zeros(10, 1);
iterations_u_3 = zeros(10, 1);

i = 1;      % Choose case 1-4

u_vector = u_initial_matrix(:,i);
constant_vector = constants(:,i);

iterations_u_1(1) = u_initial_matrix(1,i);
iterations_u_2(1) = u_initial_matrix(2,i);
iterations_u_3(1) = u_initial_matrix(3,i);


J = jac_matrix(u_vector, constant_vector);  % The Jacobian Matrix
func_vector = function_vector_matrix(u_vector, constant_vector);

% J\func_vector is the same as inv_jacobian * function_vector
d_variabler = J\func_vector;
u_next_vector = u_vector - d_variabler;

counter = 1;

while max(abs(d_variabler)) > 1e-15
    counter = counter + 1;
    u_vector = u_next_vector;

    if counter < 10
        iterations_u_1(counter) = u_vector(1);
        iterations_u_2(counter) = u_vector(2);
        iterations_u_3(counter) = u_vector(3);  
    end

J = jac_matrix(u_vector, constant_vector);

func_vector = function_vector_matrix(u_vector, constant_vector);

d_variabler = J\func_vector;
u_next_vector = u_vector - d_variabler;
end

u_vector = u_next_vector;


for j = 1:3
    u_result(j) = u_vector(j);
end 

error_matrix = zeros(10,3);
for k = 1:counter
    error_matrix(k,1) = abs(iterations_u_1(k) - u_result(1));
    error_matrix(k,2) = abs(iterations_u_2(k) - u_result(2));
    error_matrix(k,3) = abs(iterations_u_3(k) - u_result(3));
end

error_matrix_1 = error_matrix(1:end-1,:);
error_matrix_2 = error_matrix(2:end,:);
X = error_matrix_2;

for l = 1:3
figure(l)
loglog(error_matrix_2(1:5,l), error_matrix_1(1:5,l))
hold on
loglog(X, 1e2*X, '--', X, 1e0*X.^(1/2), '--', X, 1e-1*X.^(1/3), '--')
title('Conversion order for the u:s')
xlabel('en')
ylabel('en+1')
legend({'u_1', 'x', 'x^(1/2) ', 'x^(1/3)'},'Location','southwest')
end 
