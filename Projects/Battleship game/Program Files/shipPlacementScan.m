function [Scan, playerGrid] = shipPlacementScan(x,y, playerGrid, orientation, shipLength, shipID)


Scan = 1;

if orientation == 1;
    if playerGrid(x :(x + (shipLength - 1)), y) == 0
        playerGrid(x :(x + (shipLength - 1)), y) = shipID;
    else
        Scan = 0;
    end
    
else
    if playerGrid(x, y : (y + (shipLength - 1))) == 0
        playerGrid(x, y : (y + (shipLength - 1))) = shipID;
    else
        Scan = 0;
    end
end





fprintf('           A     B     C     D     E     F     G     H     I     J\n');
disp(playerGrid);

end

%Zach Sentivany