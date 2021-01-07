function [ game, shotScan, playerGrid,AIShotGrid]=shotCheckAI(AIShotX,AIShotY,AIShotGrid,playerGrid,shotScan);
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
k=0;
game=0; %game is running
while k~=1
    if playerGrid(AIShotX,AIShotY)~=0 %if shot hits something
        AIShotGrid(AIShotX,AIShotY)=1; %Adds shot to shot list
        
         if playerGrid(AIShotX,AIShotY)==31  %FROM HERE
         fprintf('Your battleship has been hit!\n')
     elseif playerGrid(AIShotX,AIShotY)==32
         fprintf('Your carrier has been hit!\n')
     elseif playerGrid(AIShotX,AIShotY)==33
         fprintf('Your destroyer has been hit!\n')
     elseif playerGrid(AIShotX,AIShotY)==34
         fprintf('Your submarine has been hit!\n')
     elseif playerGrid(AIShotX,AIShotY)==35
         fprintf('Your patrol boat has been hit!\n')
         end                       %TO HERE just keeps track of what is hit
         playerGrid(AIShotX,AIShotY)=0; %sets shot location to 0
        k=1; %Breaks while loop
       
    else %If shot doesn't hit something
        fprintf('The AI has missed.\n');
        AIShotGrid(AIShotX,AIShotY)=1; %Add shot to shot list
        k=1; %Break while loop       
    end
   if sum(playerGrid(1:end))==55 %If no ships remain
          game=1; %Game ends
          fprintf('All friendly ships have been sunk! You have lost!\n')
          break %SHOULD end script here
   end
end
end
%Tyler Sullivan
