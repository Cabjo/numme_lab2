% Initial guesses
u_1 = 1;
u_2 = .8;
u_3 = -.2;
u_vector = [u_1 u_2 u_3]';

L = 1;
m_1 = 1;
m_2 = 1;

% The Jacobian Matrix
jacobian = [1:3; 1:3; 1:3];

jacobian(1) = - sin(u_1);
jacobian(2) = cos (u_1);
jacobian(3) = m_2/cos(u_1)^2;
jacobian(4) = - sin(u_2);
jacobian(5) = cos (u_2);
jacobian(6) = - (m_1 + m_2)/cos(u_2)^2;
jacobian(7) = - L * sin(u_3);
jacobian(8) = L*cos(u_3);
jacobian(9) = m_1/cos(u_3)^2;
inv_jacobian = inv(jacobian);


f = cos(u_1) + cos(u_2) + L * cos(u_3) - 2;
g = sin(u_1) + sin(u_2) + L * sin(u_3);
h = m_2*tan(u_1) - (m_1 + m_2)*tan(u_2) + m_1*tan(u_3);

function_vector = [f g h]';
function_vector;

u_next_vector = u_vector - inv_jacobian * function_vector;

while abs(sum(u_vector - u_next_vector)) > 10^(-3)
    u_vector = u_next_vector;
    u_1 = u_vector(1);
    u_2 = u_vector(2);
    u_3 = u_vector(3);
    
    jacobian(1) = - sin(u_1);
    jacobian(2) = cos (u_1);
    jacobian(3) = m_2/cos(u_1)^2;
    jacobian(4) = - sin(u_2);
    jacobian(5) = cos (u_2);
    jacobian(6) = - (m_1 + m_2)/cos(u_2)^2;
    jacobian(7) = - L * sin(u_3);
    jacobian(8) = L*cos(u_3);
    jacobian(9) = m_1/cos(u_3)^2;
    inv_jacobian = inv(jacobian);
    
    f = cos(u_1) + cos(u_2) + L * cos(u_3) - 2;
    g = sin(u_1) + sin(u_2) + L * sin(u_3);
    h = m_2*tan(u_1) - (m_1 + m_2)*tan(u_2) + m_1*tan(u_3);
    function_vector = [f g h]'

    u_next_vector = u_vector - inv_jacobian * function_vector;
end

u_vector = u_next_vector;
u_1 = u_vector(1);
u_2 = u_vector(2);
u_3 = u_vector(3);

Ax = 0;
Ay = 0;
m1x = cos(abs(u_1)); 
m1y = -sin(abs(u_1));
m2x = m1x + cos(abs(u_2));
m2y = m1y - sin(abs(u_2));
Bx = m2x + cos(abs(u_3));
By = m2y + sin(abs(u_3));

x = [Ax m1x m2x Bx Ax];
y = [Ay m1y m2y By Ay];

plot(x, y)
