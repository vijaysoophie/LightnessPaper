% CopyOverFigures
%
% This script copies over figures made by the various analysis scripts and
% renames them to match the figure numbers in the paper describing this
% work.
%
% Oct 7 2017 VS wrote this 

%% Get directory to fill up with the figure parts
figuresStorageDirectory = '/Users/vijaysingh_local/Documents/LightnessPaper/codeForFigures/codeToMakeFigures/'; 
            % point this to the directory where the figures are stored
figureDir = '/Users/vijaysingh_local/Documents/LightnessPaper/Figures';


% Figure4: Copy results for figure 4. These are the results for case 9
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filters','case9SVD.pdf') ' ' fullfile(figureDir,'Figure4','Figure4_a.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filters','case9AMA.pdf') ' ' fullfile(figureDir,'Figure4','Figure4_b.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filterResponse','case9FiltersResponse.pdf') ' ' fullfile(figureDir,'Figure4','Figure4_c.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'estimatesVsActual','Case9Results.pdf') ' ' fullfile(figureDir,'Figure4','Figure4_d.pdf')];
unix(copyCmd);

% Figure5: Copy results for figure 5.
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'RMSEvsNEigVals','RMSEvsNFilters16.pdf') ' ' fullfile(figureDir,'Figure5','Figure5.pdf')];
unix(copyCmd);

% Figure6: Copy results for figure 6. These are the results for case 10
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filters','case10SVD.pdf') ' ' fullfile(figureDir,'Figure6','Figure6_a.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filters','case10AMA.pdf') ' ' fullfile(figureDir,'Figure6','Figure6_b.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filterResponse','case10FiltersResponse.pdf') ' ' fullfile(figureDir,'Figure6','Figure6_c.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'estimatesVsActual','Case10Results.pdf') ' ' fullfile(figureDir,'Figure6','Figure6_d.pdf')];
unix(copyCmd);

% Figure7: Copy results for figure 7. These are the results for case 12
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filters','case12SVD.pdf') ' ' fullfile(figureDir,'Figure7','Figure7_a.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filters','case12AMA.pdf') ' ' fullfile(figureDir,'Figure7','Figure7_b.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'filterResponse','case12FiltersResponse.pdf') ' ' fullfile(figureDir,'Figure7','Figure7_c.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'estimatesVsActual','Case12Results.pdf') ' ' fullfile(figureDir,'Figure7','Figure7_d.pdf')];
unix(copyCmd);

% Figure8: Copy results for figure 8. These are the results for case 12
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'barGraphs','SummaryBarGraph.pdf') ' ' fullfile(figureDir,'Figure8','Figure8_a.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'barGraphs','SVDSummaryBarGraph.pdf') ' ' fullfile(figureDir,'Figure8','Figure8_b.pdf')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(figuresStorageDirectory,'barGraphs','AMASummaryBarGraph.pdf') ' ' fullfile(figureDir,'Figure8','Figure8_c.pdf')];
unix(copyCmd);

