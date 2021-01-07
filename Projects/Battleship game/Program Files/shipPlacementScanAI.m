function [Scan, AIGrid] = shipPlacementScanAI(x,y, AIGrid, orientationAI, shipLength, shipID)


Scan = 1;

if orientationAI == 1;
    if AIGrid(x :(x + (shipLength - 1)), y) == 0
        AIGrid(x :(x + (shipLength - 1)), y) = shipID;
    else
        Scan = 0;
    end
    
else
    if AIGrid(x, y : (y + (shipLength - 1))) == 0
        AIGrid(x, y : (y + (shipLength - 1))) = shipID;
    else
        Scan = 0;
    end
end


end

%Zach Sentivany