function [game] = scoreCheckAI(AIGrid)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
l=0;
while l~=1
if sum(AIGrid(1:end))==0
    fprintf('All enemy ships have been sunk, you have won the game!\n')
    game=1;
    l=1;
end
end

