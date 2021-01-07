function [Scan, playerGrid] = shipPlacementCords(shipLength,orientation, playerGrid, shipID)
columnRef = [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
%columnRef(1) left empty in order to accomidate for the reference column of
%the player grid, if they reference element 'A' in columnRef, it will 
%return a gird column of 2, which would be correct.

%k is sentinel for this function

% if orientation = 1, placement is vertical
% if orientation = 2, placement is horizontal

k = 0;
while k ~= 1
    if orientation == 1
        
        %Column Assignment Vertical
        l = 0; %l is sentinel variable for this section
        while l ~= 1
            fprintf('Enter a valid column letter to place your ship in "%s"',columnRef(2:end));
            y = input(': ','s');
                if strcmp(y, '') == 1 %Ensures Correct user input
                    disp('Try again');
                elseif length(y) ~= 1 %Ensures Correct user input
                    disp('Try again');
                else
                    yTest = find(ismember(columnRef, y));
                    if isequal(yTest >= 1, yTest <= 11); %11 because all columns are open
                        y = find(y == columnRef); %Assigns the Column Letter to an x coordinate
                        l = 1; %Release from Loop
                    else
                        disp('Try Something Else')
                    end
                end
        end
        fprintf('\n')
        
        %Row Assignment Vertical
        
        l = 0; %l is sentinel variable for this section
        while l ~= 1
            fprintf('Enter a valid row number to place your ship in (%i to %i)', 1, 11 - shipLength) 
            x = input(': ', 's');
            
            while (isnan(str2double(x)) || str2double(x)<=0 || str2double(x)>=(12-shipLength))
            x=input('Try again: ','s');
            end
            x = str2num(x);
            
                if x >= 1 && x <= (11 - shipLength) %BUG: entering a letter here breaks the program
                    l = 1; %Release from Loop
                    k = 1;
                    fprintf('\n')
                end
        end
        
        
        
    else %Can use an else here, because the only other possible orientation value is 2
        %Column Assignment Horizontal
        l = 0; %l is sentinel variable for this section
        while l ~= 1
            fprintf('Enter a valid column letter to place your ship in "%s"',columnRef(2: 12 - shipLength));
            y = input(': ','s');
                if strcmp(y, '') == 1 %Ensures Correct user input
                    disp('Try again');
                elseif length(y) ~= 1 %Ensures Correct user input
                    disp('Try again');
                else
                    yTest = find(ismember(columnRef, y));
                    if isequal(yTest >= 1, yTest <= (12 - shipLength)); %11 because all columns are open
                        y = find(y == columnRef); %Assigns the Column Letter to an y coordinate
                        l = 1; %Release from Loop
                    else
                        disp('Try Something Else')
                    end
                end
        end
        fprintf('\n')
        
        
        %Row Assignment Horizontal
        l = 0; %l is sentinel variable for this section
        while l ~= 1
            fprintf('Enter a valid row number to place your ship in (%i to %i)', 1, 10) 
            x = input(': ', 's');
            
            while (isnan(str2double(x)) || str2double(x)<=0 || str2double(x)>=(11))
            x=input('Try again: ','s');
            end
            x = str2num(x);
                if x >= 1 && x <= 10 %1 to 10 due to all rows being avaliable for placement
                    l = 1; %Release from Loop
                    k = 1;
                    fprintf('\n')
                end
        end
    
    
    end        
end


[Scan, playerGrid] = shipPlacementScan(x, y, playerGrid, orientation, shipLength, shipID);
% Zach Sentivany


