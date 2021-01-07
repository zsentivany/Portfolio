function [game] = scoreCheck(playerGrid)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
fprintf('           A     B     C     D     E     F     G     H     I     J\n');
disp(playerGrid);

l=0;
while l~=1
if sum(playerGrid(1:end))==0
    fprintf('All friendly ships have been sunk, you have lost the game\n')
    game=1;
    l=1;
end
end

