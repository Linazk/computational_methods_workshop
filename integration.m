function integrationResult = integration(A, B)
% Monte Carlo method for solving an integrand function.
%   The integrand has definite bounds A and B.
%   NUMBER_OF_ITERATIONS is set to 1000.
%   Random numbers are generated from the uniform distribution.
%   inArea is the area inside the integral.
%   totalArea is the whole area.


NUMBER_OF_ITERATIONS = 1000;
inArea = 0;
totalArea = B * 5;
rng('default');
integrationResult = zeros(10, 1);

% loop for calculating the integrand.
for iIterations = 1:NUMBER_OF_ITERATIONS-1
    % loop for every value of B.
    for n = 1:length(B)
        xCoordinate = A + B (B - A) .* rand;
        yMaximum = exp( -(xCoordinate-3) .^2);
        yCoordinate = yMaximum .* rand; 
        if yCoordinate < computeIntegrand(xCoordinate)
            inArea = inArea + 1;
            NUMBER_OF_ITERATIONS = NUMBER_OF_ITERATIONS + 1;
            integrationResult = (inArea / NUMBER_OF_ITERATIONS) * totalArea;
        end
        
    end
    
end

end

function f = computeIntegrand(x)
% Integrand function.

f = exp( -(x-3) .^2);

end
