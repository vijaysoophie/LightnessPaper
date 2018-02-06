% filtersAndFilterResponses
% This script can be used to plot AMA and SVD filters and filter responses.
% This script first loads the results, plots the filters/response and saves
% the figure as .pdf. The figures are made case by case. This is a really
% dumb script. Everything needs to be typed manually.
%
% The data is stored in Johannes Burge's Ogle computer.
%
% VS wrote this Oct 7 2017

% Make the directory where the figures will be stored
if (~exist('filters','dir'))
    mkdir('filters');
end

if (~exist('filterResponse','dir'))
    mkdir('filterResponse');
end

%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case11_AMAIsomerization.mat')
plotFiltersJointResponsesModified(1,[1,2],case11Output.AMA.X,case11Output.AMA.s,case11Output.AMA.f,case11Output.AMA.ctgInd,[],[],[],[1:10])
% save2pdf('/Users/vijaysingh_local/Documents/LightnessPaper/codeForFigures/codeToMakeFigures/filterResponse/case11FiltersResponse_AMAIsomerization.pdf',gcf,600);

%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case9_AMAIsomerization.mat')
plotFiltersJointResponsesModified(1,[1,2],case9Output.AMA.X,case9Output.AMA.s,case9Output.AMA.f,case9Output.AMA.ctgInd,[],[],[],[1:10])
% Case11_AMAIsomerization

%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case10_contrast.mat')
plotFiltersJointResponsesModified(1,[1,2],case10Output.AMA.X,case10Output.AMA.s,case10Output.AMA.f,case10Output.AMA.ctgInd,[],[],[],[1:10])
% save2pdf('/Users/vijaysingh_local/Documents/LightnessPaper/codeForFigures/codeToMakeFigures/filterResponse/case10FiltersResponse_AMAIsomerization.pdf',gcf,600);

%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case1_AMAIsomerization.mat')
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case9_AMAIsomerization.mat')
plotFiltersJointResponsesModified(1,[1,2],case1Output.AMA.X,case1Output.AMA.s,case9Output.AMA.f,case1Output.AMA.ctgInd,[],[],[],[1:10])
% save2pdf('/Users/vijaysingh_local/Documents/LightnessPaper/codeForFigures/codeToMakeFigures/filterResponse/case1Images_Case9FiltersResponse_AMAIsomerization.pdf',gcf,600);

%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case1_NoIsomerizationNoise_AMANoiseTenTimesLower.mat')
plotFiltersJointResponsesModified(1,[1,2],case1Output.AMA.X,case1Output.AMA.s,case1Output.AMA.f,case1Output.AMA.ctgInd,[],[],[],[1:10])
% save2pdf('filterResponse/case1FiltersResponse_NoIsomerizationNoise_AMANoiseTenTimesLower.pdf',gcf,600);

%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case1_NoIsomerizationNoise_3TimesAMANoise.mat')
plotFiltersJointResponsesModified(1,[1,2],case1Output.AMA.X,case1Output.AMA.s,case1Output.AMA.f,case1Output.AMA.ctgInd,[],[],[],[1:10])
% save2pdf('filterResponse/case1FiltersResponse_NoIsomerizationNoise_AMANoiseTenTimesHigher.pdf',gcf,600);

%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case1_NoIsomerizationNoise.mat')
plotFiltersJointResponsesModified(1,[1,2],case1Output.AMA.X,case1Output.AMA.s,case1Output.AMA.f,case1Output.AMA.ctgInd,[],[],[],[1:10])
% save2pdf('/Users/vijaysingh_local/Documents/LightnessPaper/codeForFigures/codeToMakeFigures/filterResponse/case1FiltersResponse_RenderingNoiseOnly.pdf',gcf,600);

%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case1.mat')
plotFiltersJointResponsesModified(1,[1,2],case1Output.AMA.X,case1Output.AMA.s,case1Output.AMA.f,case1Output.AMA.ctgInd,[],[],[],[1:10])
% save2pdf('filterResponse/case1FiltersResponse.pdf',gcf,600);
%% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case2.mat')
plotFiltersJointResponsesModified(1,[1,2],case2Output.AMA.X,case2Output.AMA.s,case2Output.AMA.f,case2Output.AMA.ctgInd,[],[],[],[1:10])
% save2pdf('filterResponse/case2FiltersResponse.pdf',gcf,600);

%%
% Load AMA results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case9.mat')
plotFiltersJointResponsesModified(1,[1,2],case9Output.AMA.X,case9Output.AMA.s,case9Output.AMA.f,case9Output.AMA.ctgInd,[],[],[],[1:10])
save2pdf('filterResponse/case9FiltersResponse.pdf',gcf,600);
%%
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case10.mat')
plotFiltersJointResponsesModified(1,[1,2],case10Output.AMA.X,case10Output.AMA.s,case10Output.AMA.f,case10Output.AMA.ctgInd,[],[],[],[1:10]);
% save2pdf('/Users/vijaysingh_local/Documents/LightnessPaper/codeForFigures/codeToMakeFigures/filterResponse/case10FiltersResponse.pdf',gcf,600);
%%
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case12.mat')
plotFiltersJointResponsesModified(1,[1,2],case12Output.AMA.X,case12Output.AMA.s,case12Output.AMA.f,case12Output.AMA.ctgInd,[],[],[],[1:10]);
% save2pdf('/Users/vijaysingh_local/Documents/LightnessPaper/codeForFigures/codeToMakeFigures/filterResponse/case12FiltersResponseNoLegend.pdf',gcf,600);
%% Plot SVD Filter Response
% Load SVD results struct
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case9SVDResults.mat')
plotFiltersJointResponsesModified(1,[1,2],unique(case9Output.lumTest),case9Output.sTrain,case9Output.SVDEigenvectors',case9Output.ctgIndTrain,[],[],[],[1:10])
xlim([-0.6 0.3]);
save2pdf('filterResponse/case9FiltersResponseSVD.pdf',gcf,600);
%%
% clear;
% load('/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case10SVDResults.mat')
% plotFiltersJointResponsesModified(1,[1,2],unique(case10Output.lumTest),case10Output.sTrain,case10Output.SVDEigenvectors',case10Output.ctgIndTrain,[],[],[],[1:10])

%%
% clear;
% load('/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case12SVDResults.mat')
% plotFiltersJointResponsesModified(1,[1,2],unique(case12Output.lumTest),case12Output.sTrain,case12Output.SVDEigenvectors',case12Output.ctgIndTrain,[],[],[],[1:10])

%% PLOT AMA first two Filters 
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case9_AMAIsomerization.mat')
plotFiltersColor2D(case9Output.AMA.f(:,1:2),[],[],[],1);
save2pdf('filters/case9AMA.pdf',gcf,600);

%%
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case10.mat')
plotFiltersColor2D(case10Output.AMA.f(:,1:2),[],[],[],1);
save2pdf('filters/case10AMA.pdf',gcf,600);

%%
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case11_AMAIsomerization.mat')
plotFiltersColor2D(case11Output.AMA.f(:,1:2),[],[],[],1);
save2pdf('filters/case11AMA.pdf',gcf,600);

%%
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case12.mat')
plotFiltersColor2D(case12Output.AMA.f(:,1:2),[],[],[],1);
save2pdf('filters/case12AMA.pdf',gcf,600);


%% Plot SVD First Two Filters
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case9SVDResults.mat')
plotFiltersColor2D(case9Output.SVDEigenvectors(1:2,:)',[],[],[],1);
save2pdf('filters/case9SVD.pdf',gcf,600);

%%
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case10SVDResults.mat')
plotFiltersColor2D(case10Output.SVDEigenvectors(1:2,:)',[],[],[],1);
save2pdf('filters/case10SVD.pdf',gcf,600);

%%
clear;
load('/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case12SVDResults.mat')
plotFiltersColor2D(case12Output.SVDEigenvectors(1:2,:)',[],[],[],1);
save2pdf('filters/case12SVD.pdf',gcf,600);

close all;