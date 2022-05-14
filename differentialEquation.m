function [functionValue] = differentialEquation(x, y)
% First order differential equation.
%   This equation is independent of X.
%   functionValue is the outcome of the function.

functionValue = -y + 1/1+exp(-5*(y-1));

end

