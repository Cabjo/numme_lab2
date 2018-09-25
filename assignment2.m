% Initial guesses
u_1 = pi/3;
u_2 = pi/3;
u_3 = -pi/3;
u_vector = [u_1 u_2 u_3]';

L = 2;
m_1 = 1;
m_2 = 1;

% The Jacobian Matrix
J = jacobian(u_1, u_2, u_3, L, m_1, m_2);

% Vector with the results from the three functions
func_vector = function_vector(u_1, u_2, u_3, L, m_1, m_2);

% J\func_vector is the same as inv_jacobian * function_vector
u_next_vector = u_vector - J\func_vector;

while abs(sum(u_vector - u_next_vector)) > 10^(-3)
    u_vector = u_next_vector;
    u_1 = u_vector(1);
    u_2 = u_vector(2);
    u_3 = u_vector(3);
    
    J = jacobian(u_1, u_2, u_3, L, m_1, m_2);
    
    func_vector = function_vector(u_1, u_2, u_3, L, m_1, m_2);

    u_next_vector = u_vector - J\func_vector;
end

u_vector = u_next_vector;
u_1 = u_vector(1);
u_2 = u_vector(2);
u_3 = u_vector(3);

Ax = 0;
Ay = 0;
Bx = 2;
By = 0;
m1x = cos(abs(u_1)); 
m1y = -sin(abs(u_1));
m2x = Bx - L*cos(abs(u_3));
m2y = By - L*sin(abs(u_3));

x = [Ax m1x m2x Bx Ax];
y = [Ay m1y m2y By Ay];

plot(x, y);

