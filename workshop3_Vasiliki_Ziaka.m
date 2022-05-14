function [outputEuler, outputMidpointMethod, outputRungeKutta] = workshop3_Vasiliki_Ziaka_Task1(stepSize)
% Solutions for the differential equation.
%   stepSize should be set to a small number for stability.
%   outputEuler is a 1x11 output vector using the Euler method.
%   outputMidpointMethod is a 1x11 output vector using the midpoint method.
%   outputRungeKutta is a 1x11 output vector using the Runge-Kutta method.

outputEuler = eulerMethod(stepSize);
outputMidpointMethod = midpointMethod(stepSize);
outputRungeKutta = rungeKutta(stepSize);

end

%% Differential Equation

function [functionValue] = differentialEquation(x, y)
% First order differential equation.
%   This equation is independent of X.
%   functionValue is the outcome of the function.

functionValue = -y + 1/1+exp(-5*(y-1));

end

%% Euler's Method

function [y] = eulerMethod(stepSize)
% Euler's method for solving differential equations.
%   stepSize should be set to a small number for stability.
%   y is the outcome vector for 11 steps.

steps = 11;
y = zeros(1, 11);
y(1) = 1; % initial value.

for i = 1:steps-1 
    
    y(i+1) = y(i) + stepSize * differentialEquation(0, y(i));
    
end

end

%% Midpoint Method

function [y] = midpointMethod(stepSize)
% Midpoint method for solving differential equations.
%   stepSize should be set to a small number for stability.
%   y is the outcome vector for 11 steps.

steps = 11;
y = zeros(1, 11);
y(1) = 1; % initial value of y.

for i = 1:steps-1
    
    y(i+1) = y(i) + stepSize * y(i) + 1/2 * differentialEquation(0, y(i));
    
end

end

%% Runge-Kutta Method

function [y] = rungeKutta(stepSize)
% Runge-Kutta method for solving differential equations.
%   stepSize should be set to a small number for stability.
%   y is the outcome vector for 11 steps.

steps = 11;
y = zeros(1, 11);
y(1) = 1; % initial value.

for i = 1:steps-1
    k1 = stepSize * differentialEquation(0, y(i));
    k2 = stepSize * y(i) + k1/2 * differentialEquation(0, y(i));
    k3 = stepSize * y(i) + k2/2 * differentialEquation(0, y(i));
    k4 = stepSize * y(i) + k3 * differentialEquation(0, y(i));
    y(i+1) = y(i) + (k1 + 2 * k2 + 2 * k3 + k4/6) * stepSize;
end

end

%% Task 2

function [chain] = workshop3_Vasiliki_Ziaka_Task2(startingValue)

% Markov Chain Monte Carlo algorithm.
%   Calculates the best parameters by producing a chain of random numbers from the normal distribution.
%   chain is a vector and is set to 2000 iterations.
%   startingValue is a plausible value for the parameter that initiates the chain.
%   sdProposalDistribution is the standard deviation of the proposal distribution.
%   meanPriorDistribution is the mean of the prior distribution.
%   sdPriorDistribution is the standard deviation of the prior distribution.
%   scale is a Weibul distribution parameter.

chain = (1:2000);
chain(1) = startingValue;
sdProposalDistribution = 0.2;
meanPriorDstribution = 1.5;
sdPriorDistribution = 1.5;
scale = 6;
data = [2, 4, 3, 1, 6, 2, 2.5, 7, 10];

for i = 2:length(chain)
    current = chain(i-1);
    proposal = current + normrnd(0, sdProposalDistribution);
    
    if  (wblpdf(data, scale, proposal) * normpdf(proposal, meanPriorDstribution, sdPriorDistribution)) > ...
            (wblpdf(data, scale, current) * normpdf(current, meanPriorDstribution, sdPriorDistribution))
        chain(i) = proposal; % accept proposal.
        
    elseif normrnd(0, sdProposalDistribution) < wblpdf(data, scale, proposal) * ...
            normpdf(proposal, meanPriorDstribution, sdPriorDistribution) / ...
            wblpdf(data, scale, current) * normpdf(current, meanPriorDstribution, sdPriorDistribution)
        chain(i) = proposal;
        
    else
        
        chain(i) = current; % reject proposal.
        
    end
    
end

end