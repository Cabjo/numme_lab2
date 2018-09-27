function J = jac(u_1, u_2, u_3, L, m_1, m_2)
J = [-sin(u_1) -sin(u_2) -L*sin(u_3); cos(u_1) cos(u_2) L*cos(u_3); m_2/cos(u_1)^2 -(m_1 + m_2)/cos(u_2)^2 m_1/cos(u_3)^2];
end

