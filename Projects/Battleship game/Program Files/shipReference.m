function [shipLength,shipType, shipID] = shipReference(x)
shipRef = [4, 5, 3, 3, 2 ];
shipLength = shipRef(x);

if x == 1
    shipType = 'Battleship';
    shipID = 31;
elseif x == 2
    shipType = 'Carrier';
    shipID = 32;
elseif x == 3
    shipType = 'Submarine';
    shipID = 33;
elseif x == 4
    shipType = 'Destroyer';
    shipID = 34;
else
    shipType = 'Frigate';
    shipID = 35;



end

% Zach Sentivany