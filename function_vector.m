function vector = function_vector(u_1, u_2, u_3, L, m_1, m_2)
f = cos(u_1) + cos(u_2) + L * cos(u_3) - 2;
g = sin(u_1) + sin(u_2) + L * sin(u_3);
h = m_2*tan(u_1) - (m_1 + m_2)*tan(u_2) + m_1*tan(u_3);
vector = [f g h]';
end

