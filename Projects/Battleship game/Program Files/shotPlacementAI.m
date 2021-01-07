function [ game, shotScan, playerGrid, AIShotGrid ] = shotPlacementAI( playerGrid,AIShotX,AIShotY,AIShotGrid )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
shotScan=0;
game=0;        
[ game,shotScan,playerGrid, AIShotGrid ] = shotPlacementScanAI(AIShotX, AIShotY, AIShotGrid, playerGrid );
end

%Tyler Sullivan
