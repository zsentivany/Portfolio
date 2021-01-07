function [x] = GridPlacementTutorial(y)
if y == 1
    PlayerGrid = zeros (1*10).*[1:10];
    GridExample = [1:10];

    fprintf('\n\n\nBefore placing your ship, you must give the placement orientation\n')
    fprintf('If you would like to place the ship up and down, type "Vertical"...\n')
    fprintf('If you would like to place the ship left and right, type "Horizontal"...\n\n')
        
    fprintf('During ship placement, after giving an appropriate orientation you will be \n')
    fprintf('given a range of selectable values in which you can place your ship.\n')
    fprintf('Below is an example grid, along with row numbers and column letters. \n\n')

    fprintf('When deploying a ship to the grid, the ship will place left to\n')
    fprintf('right if the orientation is horizontal, and top to bottom if the orientation\n')
    fprintf('is vertical. For example, if you are placing a carrier which occupies five\n')
    fprintf('grid spaces, and you choose to place it horizontally, you will only be given A-F\n')
    fprintf('as options for your column placement. If you were placing vertically, you would be\n')
    fprintf('restricted to rows 1-6 for your placement. After selecting a grid location\n')
    fprintf('the ship will fill out the grid with the appropriate amount of occupied spaces.\n')
    fprintf(2,'NOTE: You may not intersect another friendly ship on the grid.\n\n\n')


    fprintf('        A     B     C     D     E     F     G     H     I     J\n')
    fprintf('  1'); disp(GridExample)
    fprintf('  2'); disp(GridExample + 10)
    fprintf('  3'); disp(GridExample + 20)
    fprintf('  4'); disp(GridExample + 30)
    fprintf('  5'); disp(GridExample + 40)
    fprintf('  6'); disp(GridExample + 50)
    fprintf('  7'); disp(GridExample + 60)
    fprintf('  8'); disp(GridExample + 70)
    fprintf('  9'); disp(GridExample + 80)
    fprintf(' 10'); disp(GridExample + 90)

    fprintf('The player must first enter a column letter from a given list\n')
    fprintf('followed by a row number. For example, the location B7 corresponds\n')
    fprintf('with 62 in the above grid. The game will then deploy your ship to\n')
    fprintf('the grid in the appropriate orientation based off previous input. Your \n')
    fprintf('input will be restricted based upon your ship size and orientation \n')
    fprintf('as to prevent an error with placement \n\n\n')
end

x = '';
end

%Zach Sentivany