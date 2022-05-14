function [y] = rungeKutta(stepSize)
% Runge-Kutta method for solving differential equations.
%   Detailed explanation goes here
%   y is the outcome vector for 11 steps.

steps = 11;
y = zeros(1, 11);
y(1) = 1; % initial value.

for i = 1:steps-1
    k1 = stepSize * diffEquation(0, y(i));
    k2 = stepSize * y(i) + k1/2 * diffEquation(0, y(i));
    k3 = stepSize * y(i) + k2/2 * diffEquation(0, y(i));
    k4 = stepSize * y(i) + k3 * diffEquation(0, y(i));
    y(i+1) = y(i) + (k1 + 2 * k2 + 2 * k3 + k4/6) * stepSize;
end 

end

