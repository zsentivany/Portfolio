function [ game, shotScan, AIGrid, playerShotGrid, i ] = shotPlacementScan( playerShotX, playerShotY, playerShotGrid, AIGrid )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
shotScan = 1;
if playerShotGrid(playerShotX,playerShotY)==0

else
    shotScan=0;
end

if shotScan == 1 %If shot has not already been attempted 
         i=1; %shot advances and turn changes

    elseif shotScan == 0 %If shot has already been attempted
        %Returns to shot attempt to enter new coordinates
        disp('You entered an illegal location or have already shot at this location, please try again...');
    end
[ game, shotScan, AIGrid,playerShotGrid]=shotCheck(playerShotX,playerShotY,playerShotGrid,AIGrid,shotScan);
end

%Tyler Sullivan