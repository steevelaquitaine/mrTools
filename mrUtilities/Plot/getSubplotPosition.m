function position = getSubplotPosition(X,Y,horizontalGrid,verticalGrid,xMargin,yMargin)
% getSubplotPosition.m
%
%        $Id$
%      usage: position  =getSubplotPosition(X,Y,verticalGrid,horizontalGrid,xMargin,yMargin)
%         by: julien besle
%       date: 28/11/2010
%    purpose: returns normalized position for subplot or uicontrol
%     inputs: - X and Y are integers specifying the extent and location of the subplot in the grid (from left to right and top to bottom)
%             - horizontalGrid and verticalGrid are vector specifying the dimensions of each subplot row and columns (in any unit,from left to right and top to bottom)
%             - xMargin and yMargin are the width left blank between subplots (same units as horizontal and vertical Grid). 
%                 They are independent from the dimensions of the grid and are removed from it
%     output: - position vector [left bottom width height]. if no margin is specified, it is better to use this position as 'outerposition'
%
%   example: h = axes('outerposition',getSubplotPosition([2,2:3,[1 1 .5],[.5 1 1 .5],.1)) 
%                     creates a virtual 3*4 grid in the figure
%                     and draws axes on the second columns, spanning the second and third rows of the grid


if any(X>length(horizontalGrid)) || any(Y>length(verticalGrid))
  position = [];
  mrWarnDlg('(getSubplotPosition) Wrong dimensions');
  return;
end

if ieNotDefined('xMargin')
  xMargin = 0;
end
if ieNotDefined('yMargin')
  yMargin = 0;
end
figureWidth= sum(horizontalGrid);
figureHeigth= sum(verticalGrid);

position(1) = (sum(horizontalGrid(1:X(1)-1))+xMargin/2)/ figureWidth;
position(3) = (sum(horizontalGrid(X(1):X(end))) + (X(end)-X(1)-1)*xMargin)/ figureWidth;

position(2) = 1 - (sum(verticalGrid(1:Y(end)))-yMargin/2) / figureHeigth;
position(4) = (sum(verticalGrid(Y(1):Y(end))) + (Y(end)-Y(1)-1)*yMargin) / figureHeigth;

