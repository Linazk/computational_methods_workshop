function polygonAreaOutput = calc_polygon_area(polygonX, polygonY)
% Monte Carlo method for calculating the area of a polygon.
%   X and Y are the coordinates of the corners.
%   inArea is the area inside the polygon.
%   totalArea is the whole area.
%   maximumX, maximumY contain the maximum values for X and Y.
%   minimumX, minimumY contain the minumum values for X and Y.

NUMBER_OF_ITERATIONS = 1000;
maximumX = max(polygonX);
maximumY = max(polygonY);
minimumX = min(polygonX);
minimumY = min(polygonY);
totalArea = (maximumX - minimumX) * (maximumY - minimumY); 
inArea = 0;
polygonAreaOutput = zeros(1);
rng('default');

% loop for calculating the polygon area.
for iIterations = 1:NUMBER_OF_ITERATIONS
    polygonXrandom = minimumX + (maximumX - minimumX) .* rand;
    polygonYrandom = maximumY + (maximumY - minimumY) .* rand;
    if inpolygon(polygonXrandom, polygonYrandom, polygonX, polygonY) 
        inArea = inArea +1;
        NUMBER_OF_ITERATIONS = NUMBER_OF_ITERATIONS + 1;
        polygonAreaOutput = (inArea / NUMBER_OF_ITERATIONS) .* totalArea;
    end
    
end

end

