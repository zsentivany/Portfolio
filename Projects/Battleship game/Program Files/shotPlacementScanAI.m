function [ game,shotScan,playerGrid, AIShotGrid ] = shotPlacementScanAI( AIShotX, AIShotY, AIShotGrid, playerGrid )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
shotScan=1;
if AIShotGrid(AIShotX,AIShotY)==0
else
    shotScan=0;
end
[game,shotScan,playerGrid,AIShotGrid]=shotCheckAI(AIShotX,AIShotY,AIShotGrid,playerGrid,shotScan);
end

%Tyler Sullivan