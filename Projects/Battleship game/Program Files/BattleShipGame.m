% Insert Art Here %Section Written by: Tyler Sullivan
fprintf('888888b.         d8888 88888888888 88888888888 888      8888888888 .d8888b.  888    888 8888888 8888888b.  \n888  "88b       d88888     888         888     888      888       d88P  Y88b 888    888   888   888   Y88b\n888  .88P      d88P888     888         888     888      888       Y88b.      888    888   888   888    888\n8888888K.     d88P 888     888         888     888      8888888    "Y888b.   8888888888   888   888   d88P\n888  "Y88b   d88P  888     888         888     888      888           "Y88b. 888    888   888   8888888P" \n888    888  d88P   888     888         888     888      888             "888 888    888   888   888       \n888   d88P d8888888888     888         888     888      888       Y88b  d88P 888    888   888   888       \n8888888P" d88P     888     888         888     88888888 8888888888 "Y8888P"  888    888 8888888 888       \n')



fprintf(' \n \n \n \n');


fprintf('Welcome to Battleship\n');
fprintf(' \n \n \n \n');

%% Difficulty Selection Module %Section Written by: Zach Sentivany
fprintf('Please enter computer difficulty: \n')

i = 0;
while i ~= 1
    difficulty = input('Type "Easy" or "Hard" (Case Sensitive): ','s');
    
    if strcmp(difficulty, 'Easy') == 1;
        disp ('EASY DIFFICULTY');
        i = 1;
    
    elseif strcmp(difficulty, 'Hard') == 1;
        disp ('HARD DIFFICULTY');
        i = 1;
        p = 1;
    
    else
        disp('You did not enter a valid difficulty, Please try again.')
    end
    
end

%% Placement tutorial %Section Written by: Zach Sentivany 
%This should come before GRID PLACEMENT MODULE,  REQUIRES FUNCTION FILE: GridPlacementTutorial.m
i = 0;
while i ~= 1;
    help = input('Type "help" for a tutorial on how to place ships, otherwise, press enter: ','s');
   
    if strcmp(help, 'help') == 1
       GridPlacementTutorial(1);
        
        i = 1;
   
    elseif strcmp(help, '') == 1
        i = 1;
    
        
    end
end

%% Grid Module %Section Written by: Zach Sentivany
fprintf('Begin placing your ships\n\n')
playerGrid = zeros(10,1)*(1:11);
playerGrid(:,1) = (1:10);
playerShotGrid = zeros(10,1)*(1:11);
playerShotGrid(:,1) = (1:10);

i = 1;
while i ~= 6
    [shipLength, shipType, shipID]= shipReference(i);
    [Scan, playerGrid] = shipPlacement(shipLength, shipType, playerGrid, shipID);
    if Scan == 1;
         i = i + 1;
    elseif Scan == 0;
        disp('You entered an illegal location, please try again...');
    end
end
%% AI %Section Written by: Zach Sentivany
AIGrid = zeros(10,1)*(1:11);
AIGrid(:,1) = (1:10);
i = 1;
while i ~= 6
    [shipLength, shipType, shipID]= shipReference(i);
    [Scan, AIGrid] = shipPlacementAI(shipLength, shipType, AIGrid, shipID);
    if Scan == 1;
         i = i + 1;
    elseif Scan == 0;
    end
   
end
 fprintf('The AI Board is complete.\n')
%% Game %Section Written by: Tyler Sullivan
%NOTES About progress: 
%Bug:Game doesn't quit after win condition met.
%Bug:When entering a value that has already been entered, still says
%"miss" FIXED
%THEN says to input another value
%Same bug occurs for AI, it looks like it is taking several shots, but it
%is just re-randomizing its shot to take a valid shot.
%Due to the same issue occuring with scanning after a hit, only random/EASY
%shots are supported
%Bug: Same as placement, if a letter is entered in row input, error occurs
playerShotGrid = zeros(10,1)*(1:11); %intitializes grids to keep track of shots
playerShotGrid(:,1) = (1:10);%^
AIShotGrid = zeros(10,1)*(1:11);%^
AIShotGrid(:,1) = (1:10);%^
game=0; %initializes while loop variables
while game==0 %Game Running
 i=0;%Keeps track of who's turn it is
while i==0 %Player turn
    fprintf('           A     B     C     D     E     F     G     H     I     J\n');
disp(playerShotGrid);%Displays shotgrid so player knows where they've shot.
fprintf('           A     B     C     D     E     F     G     H     I     J\n');
disp(playerGrid); %Displays player grid, so player knows where their boats still are
    columnRef = [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
l=0; %Variable to keep track of placement commands
while l~=1 %will not advance until l=1
    k=0; %For column placement

while k~=1 %Column Assignment
    fprintf('Enter a valid column letter for your shot')
    playerShotY=input(': ','s'); %Must meet proper conditions to advance
    if strcmp(playerShotY,'')==1
        disp('Try Again')
    elseif length(playerShotY)~=1
        disp('Try Again')
    else
        shotytest=find(ismember(columnRef, playerShotY));
        if isequal(shotytest>=1, shotytest<=11);
            playerShotY=find(playerShotY==columnRef);
            l=1;
            k=1;
        else
            disp('Try something else')
        end
    end
end
fprintf('\n');

k=0; %Resets variable for row assignment
while k~=1 %Row Assignment
    fprintf('Enter a valid row number for your shot (1:10)')
    playerShotX=input(': ','s');
            
    while (isnan(str2double(playerShotX)) || str2double(playerShotX)<=0 || str2double(playerShotX)>=(11))
        playerShotX=input('Try again: ','s');
    end
    playerShotX = str2num(playerShotX);
    
    if playerShotX>=1 && playerShotX <=10
        k=1; %breaks loop
        l=1; %^
        fprintf('\n')
    end
end
    
    [ game, shotScan, AIGrid, playerShotGrid, i ] = shotPlacement( AIGrid,playerShotX,playerShotY,playerShotGrid ); %Begins shot function
    
end
end

while i==1 %AI turn
    fprintf('AI Turn: \n');
    if strcmp(difficulty,'Hard')==1 % Note: Encountered the same problem as before with AI not advancing turn, so only using random shots for now.
l=0; 
while l~=1 %Must =1 to advance
    k=0;
while k~=1 %Column Assignment
   
    AIShotY=randi([2 11],1); %sets random coordinate for column value, must be from 2-11 because column 1 is a display value
    k=1;
end
k=0;
    while k~=1 %Row Assignment
    AIShotX=randi(10); %random value for row 1-10
        k=1; %Breaks loop
        l=1; %^
    end
end
    
    
[ game, shotScan, playerGrid, AIShotGrid ] = shotPlacementAI( playerGrid,AIShotX,AIShotY,AIShotGrid ); % Initializes shot function


    if shotScan == 1 %If shot has not been attempted
         i=0; %Passes through, turn advances
    elseif shotScan == 0 %if shot has already been attempted
        %new Random shot is attempted
        %THIS LINE IS FOR TESTING ONLY:disp('AI entered an illegal location or have already shot at this location, please try again...');
    end
    end
end
end


