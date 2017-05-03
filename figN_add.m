function h = figN_add(figN,ax,xfrac,yfrac,fontsz,interp,fontwt )
% h = figN_add(figN,ax,xfrac,yfrac,fontsz,interp,fontwt )
% 
% Function to add a figure number or annotation to an axes
%
% INPUTS:
%   figN    - the figure number or annotation (can be string or number)
%   ax      - the axes handle
%             (default is gca)
%   xfrac   - the fraction of the plot's x-dimension to left-align 
%             (default is 0.1)
%   yfrac   - the fraction of the plot's y-dimension to base-align
%             (default is 0.05)
%   fontsz  - size of font 
%             (default is 22)
%   interp  - Interpreter for the text 
%             (default is latex)
%   fontwt  - weight of font 
%             (default is bold)
% 
% OUTPUT:
%   h       - graphics handle to the added text object

if nargin < 2 || isempty(ax)
    ax = gca;
end
if nargin < 3 || isempty(xfrac)
    xfrac = 0.1;
end
if nargin < 3 || isempty(yfrac)
    yfrac = 0.05;
end
if nargin < 4 || isempty(fontsz)
    fontsz = 22;
end
if nargin < 5 || isempty(interp)
    interp = 'latex';
end
if nargin < 6 || isempty(fontwt)
    fontwt = 'bold';
end

%% start

% position for the text
alims = axis(ax);
xl = alims(1) + xfrac*diff(alims(1:2));
yb = alims(3) + yfrac*diff(alims(3:4));
% flip if the axes are going the other way
if strcmp(get(ax,'xdir'),'reverse'), xl = alims(2) - xfrac*diff(alims(1:2)); end
if strcmp(get(ax,'ydir'),'reverse'), yb = alims(4) - yfrac*diff(alims(3:4)); end

% stringify
figNstr = num2str(figN);
% latexify
if strcmp(interp,'latex') && strcmp(fontwt,'bold')
    figNstr = ['\textbf{',figNstr,'}'];
end

h = text(ax,xl,yb,figNstr,...
     'fontsize',fontsz,'interpreter',interp,'fontweight',fontwt,...
     'horizontalalignment','left','verticalalignment','bottom');

end

