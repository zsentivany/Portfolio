    function [Scan, AIGrid] = shipPlacementAI(shipLength, shipType, AIGrid, shipID)
%k is sentinel for this program

k = 0;

while k ~= 1
    orientationAI = randi(2);
    
    if orientationAI == 1
        k = 1;
        orientationAI = 1; %If orientation is 1, it is vertical
    elseif orientationAI == 2
        k = 1;
        orientationAI = 2; %if orientation is 2, it is horizontal
    end
end



%Program ouputs orientation,
 [Scan, AIGrid] = shipPlacementCordsAI(shipLength, orientationAI, AIGrid, shipID); 
 %This function can only be reached by passing the above parameter, for instance,
 %Orientation cannot be equal to "horizontal" it must be "Horizontal"
 %This prevents the user from entering game breaking input
    
    

end

%Zach Sentivany