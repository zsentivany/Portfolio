function [game,shotScan,AIGrid,playerShotGrid]=shotCheck(playerShotX,playerShotY,playerShotGrid,AIGrid,shotScan);
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
k=0;
game=0;
if shotScan == 1
    while k~=1
        if AIGrid(playerShotX,playerShotY)~=0 %If value is not zero
            fprintf('You have hit an enemy ship!\n')
            playerShotGrid(playerShotX,playerShotY)=1; %sets shotgrid to 1 so user knows theyve shot there
            k=1;%Break loop
            AIGrid(playerShotX,playerShotY)=0; %Set AIGrid to zero because shot was successful
        else
            playerShotGrid(playerShotX,playerShotY)=1;
            fprintf('You have missed.\n')
            k=1;
        end
        if sum(AIGrid(1:end))==55 %If no ships remain (grid =0)
            game=1; %Game ends
            fprintf('All enemy ships have been sunk! You have won!\n')
            break
        end
    end
      
      
               
end
end

%Tyler Sullivan