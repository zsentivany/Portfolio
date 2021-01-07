function [Scan, playerGrid] = shipPlacement(ShipLength, shipType, playerGrid, shipID)
%k is sentinel for this program

k = 0;

while k ~= 1;
    fprintf('Enter the orientation of your %s ("Vertical" or "Horizontal")', shipType);
    orientation = input(': ', 's');
    fprintf('\n');
    
    if strcmp(orientation, 'Vertical') == 1
        k = 1;
        orientation = 1; %If orientation is 1, it is vertical
    elseif strcmp(orientation, 'Horizontal') == 1
        k = 1;
        orientation = 2; %if orientation is 2, it is horizontal
    end
end



%Program ouputs orientation,
 [Scan, playerGrid] = shipPlacementCords(ShipLength, orientation, playerGrid, shipID); 
 %This function can only be reached by passing the above parameter, for instance,
 %Orientation cannot be equal to "horizontal" it must be "Horizontal"
 %This prevents the user from entering game breaking input
    
    

end

%Zach Sentivany