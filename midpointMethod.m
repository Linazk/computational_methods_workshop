function [y] = midpointMethod(stepSize)
% Midpoint method for solving differential equations.
%   stepSize 
%   y is the outcome vector for 11 steps.

steps = 11;
y = zeros(1, 11);
y(1) = 1; % initial value of y.

for i = 1:steps-1
    
    y(i+1) = y(i) + stepSize * y(i) + 1/2 * diffEquation(0, y(i));
    
end 

end