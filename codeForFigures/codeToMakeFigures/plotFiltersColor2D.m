function plotFiltersColor2D(f,fSmp,figh,overallTitle,bsmoothing)

% function plotFilters_Defocus(f,fSmp,figh)
%
%   example call: plotFilters_Defocus(f)
%
% plot filters for defocus estimation
%
% f:          filter weights
% fSmp:       values at which filter weights are sampled
% figh:       figure handle

if ~exist('fSmp','var') || isempty(fSmp) fSmp = [0:(size(f,1)/2-1)]; fSmp = fSmp-max(fSmp)/2-1;  end
if ~exist('figh','var') || isempty(figh) figh = []; end

% HANDLE FIGURE
if isempty(figh); figure;
else              figure(figh);
end
set(gcf,'position',[991 973 500 300]);

% PLOT
for i = 1:size(f,2)
    % SUBPLOT ORGANIZATION: <= 3 plot each row, 1 row for each filter
    if ~bsmoothing        
        fSmooth = zeros(size(f,1),size(f,2));
        fSmooth(:,i) = f(:,i);
    else
        sizeOfGrid = sqrt(size(f,1)/3);
        [X,Y] = meshgrid((1:sizeOfGrid),(1:sizeOfGrid));
        [XX,YY] = meshgrid((1:0.25:sizeOfGrid),(1:0.25:sizeOfGrid));
        fSmooth = zeros(length(XX(:)),size(f,2));
        for kk = 1:3
            fSmooth((kk-1)*length(XX(:))+1:kk*length(XX(:)),i) = ...
                griddata(X(:),Y(:),f((kk-1)*length(X(:))+1:kk*length(X(:)),i),XX(:),YY(:));
        end
    end
    fSqr = reshape(fSmooth(:,i),[sqrt(size(fSmooth,1)/3) sqrt(size(fSmooth,1)/3) 3]); 
    for j = 1:3, 
        subplot(size(fSmooth,2),3,(i-1)*3+j);         
        imagesc(fSqr(:,:,j));
        set(gca, 'XTick', []);
        set(gca, 'YTick', []);
        axis square;
        
        colormap(cmapBWR);
        caxis([-.04 .04]); colormap(cmapBWR);        
        switch j
            case 1
                channelName = ' L';
            case 2
                channelName = ' M';
            case 3
                channelName = ' S';
        end
            xlabel([num2str(i),channelName],'FontSize',20);
        if (i==1 & j==2) title(overallTitle,'FontSize',20); end
%         if (i==1 & j==3) colorbar; end
        
    end
end
    