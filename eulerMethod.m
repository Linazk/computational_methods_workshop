function [y] = eulerMethod(stepSize)
% Euler's method for solving differential equations.
%   stepSize is 
%   y is the outcome vector for 11 steps.

steps = 11;
y = zeros(1, 11);
y(1) = 1; % initial value.

for i = 1:steps-1
 
    y(i+1) = y(i) + stepSize * diffEquation(0, y(i)); 
    
end 

end

