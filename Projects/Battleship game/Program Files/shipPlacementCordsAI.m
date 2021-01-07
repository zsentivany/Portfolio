function [Scan, AIGrid] = shipPlacementCordsAI(shipLength,orientationAI, AIGrid, shipID)
columnRef = [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
%columnRef(1) left empty in order to accomidate for the reference column of
%the player grid, if they reference element 'A' in columnRef, it will 
%return a gird column of 2, which would be correct.

%k is sentinel for this function

% if orientationAI = 1, placement is vertical
% if orientationAI = 2, placement is horizontal

k = 0;
while k ~= 1
    if orientationAI == 1
        
        %Column Assignment Vertical
        l = 0; %l is sentinel variable for this section
        while l ~= 1
            y=randi([2 11],1);
            l = 1; %Release from Loop
        end
    
        fprintf('\n')
        
        %Row Assignment Vertical
        
        l = 0; %l is sentinel variable for this section
        while l ~= 1 
            x = randi(10-shipLength);
            l = 1;
        end
        
        
        k=1;
    else %Can use an else here, because the only other possible orientation value is 2
        %Column Assignment Horizontal
        l = 0; %l is sentinel variable for this section
        while l ~= 1
           y=randi([2 11-shipLength],1);
           l=1;
        end
        
        
        %Row Assignment Horizontal
        l = 0; %l is sentinel variable for this section
        while l ~= 1
            x = randi(10);
            l=1; 
        end
        k=1;
        
    end
    
end


[Scan, AIGrid] = shipPlacementScanAI(x, y, AIGrid, orientationAI, shipLength, shipID);

%Zach Sentivany

