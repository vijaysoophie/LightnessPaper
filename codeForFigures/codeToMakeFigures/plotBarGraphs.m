% This script plots the RMSE bar graphs for the linear, SVD and AMA 
% methods. 
% Three bar graphs are produced.
% 1. Comparison of Naive, Linear, SVD and AMA methods for each case.
% 2. Performance of SVD Filters from one case on stimuli of other cases.
% 3. Performance of AMA Filters from one case on stimuli of other cases.
%
% VS wrote this Oct 7 2017


% Load the results for all cases
% SVD Results
clear;
results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case9SVDResults.mat']);
results9SVD = results.case9Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case10SVDResults.mat']);
results10SVD = results.case10Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case12SVDResults.mat']);
results12SVD = results.case12Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case12RotatedSVDResults.mat']);
results12RSVD = results.case12Rotated;

% AMA Results
results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case9.mat']);
results9AMA = results.case9Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case10.mat']);
results10AMA = results.case10Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case12.mat']);
results12AMA = results.case12Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case12Rotated.mat']);
results12RAMA = results.case12Rotated;

% Linear Results

linearCase9 = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/Case9.mat');
linearCase10 = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/case10.mat');
linearCase12 = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/case12.mat');
% linearCase12R = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/case12.mat');

%%
% Make the directory where the figures will be stored
if (~exist('barGraphs','dir'))
    mkdir('barGraphs');
end

% Define the colors to be used for each method
naiveColor  = 'm';
linearColor = 'k';   
SVDColor    = 'g';
AMAColor    = 'r';

% Plot the bars corresponding to RMSE
fig2 = figure;
set(fig2,'units','pixels', 'Position', [1 1 500 500]);
hold on;
naiveRelRMSE = sqrt(mean(((linspace(0.2,0.6,10)-mean(linspace(0.2,0.6,10)))./linspace(0.2,0.6,10)).^2));
hBar=bar([naiveRelRMSE linearCase9.cNormLinearRMSETest results9SVD.Case9error(8) results9AMA.Case9error(8); ...
    naiveRelRMSE linearCase10.cNormLinearRMSETest results10SVD.Case10error(8) results10AMA.Case10error(8); ...
    naiveRelRMSE linearCase12.cNormLinearRMSETest results12SVD.Case12error(8) results12AMA.Case12error(8)]);
ylim([0 0.5]);
ylabel('Relative RMSE');
set(gca, 'XTickLabels', {'Cone Response'; 'Contrast'});
legend('Naive', 'Linear', 'SVD', 'AMA', 'Location','NorthEast');
set(gca,'FontSize',20);

hBar(1).FaceColor = naiveColor;
hBar(2).FaceColor = linearColor;
hBar(3).FaceColor = SVDColor;
hBar(4).FaceColor = AMAColor;

ylim([0 0.5]);
xlim([0.5 3.5]);
ylabel('Relative RMSE');
% set(gca, 'XTick',[1 2 3 4],'XTickLabels', {'Naive', 'Linear Regression Center Pixel', 'SVD-LDA', 'AMA'},'TickLabelInterpreter','latex');
set(gca, 'XTick',[1 2 3],'XTickLabels', {'Case 1', 'Case 2','Case 3'});
set(gca,'FontSize',24);
box on;
axis square;
save2pdf('barGraphs/SummaryBarGraph.pdf');
close;

%% Make Bar Graphs for SVD Comparision Results
% Define the colors to be used for each method
case9Color  = 'm';
case10Color = 'k';   
case12Color = 'g';
case12RColor = 'r';

% Plot the bars corresponding to RMSE
fig2 = figure;
set(fig2,'units','pixels', 'Position', [1 1 500 500]);
hold on;

hBar=bar([results9SVD.Case9error(8)    results10SVD.Case9error(8)  results12SVD.Case9error(8); ...
    results9SVD.Case10error(8)    results10SVD.Case10error(8)  results12SVD.Case10error(8); ...
    results9SVD.Case12error(8)    results10SVD.Case12error(8)  results12SVD.Case12error(8)]);
ylim([0 0.5]);
ylabel('Relative RMSE');
legend('Case 1 SVD RF', 'Case 2 SVD RF', 'Case 3 SVD RF', 'Location','NorthEast');
set(gca,'FontSize',20);

hBar(1).FaceColor = case9Color;
hBar(2).FaceColor = case10Color;
hBar(3).FaceColor = case12Color;

ylim([0 0.5]);
ylabel('Relative RMSE');
% set(gca, 'XTick',[1 2 3 4],'XTickLabels', {'Naive', 'Linear Regression Center Pixel', 'SVD-LDA', 'AMA'},'TickLabelInterpreter','latex');
set(gca, 'XTick',[1 2 3],'XTickLabels', {'Case 1', 'Case 2','Case 3'});
set(gca,'FontSize',24);
box on;
axis square;
save2pdf('barGraphs/SVDSummaryBarGraph.pdf');
close;

%% Make Bar Graphs for AMA Comparision Results
% Define the colors to be used for each method
case9Color  = 'm';
case10Color = 'k';   
case12Color = 'g';
case12RColor = 'r';

% Plot the bars corresponding to RMSE
fig2 = figure;
set(fig2,'units','pixels', 'Position', [1 1 500 500]);
hold on;

hBar=bar([results9AMA.Case9error(8)    results10AMA.Case9error(8)  results12AMA.Case9error(8); ...
    results9AMA.Case10error(8)    results10AMA.Case10error(8)  results12AMA.Case10error(8); ...
    results9AMA.Case12error(8)    results10AMA.Case12error(8)  results12AMA.Case12error(8)]);
ylim([0 0.5]);
ylabel('Relative RMSE');
legend('Case 1 AMA RF', 'Case 2 AMA RF', 'Case 3 AMA RF', 'Location','NorthEast');
set(gca,'FontSize',20);

hBar(1).FaceColor = case9Color;
hBar(2).FaceColor = case10Color;
hBar(3).FaceColor = case12Color;

ylim([0 0.5]);
ylabel('Relative RMSE');
set(gca, 'XTick',[1 2 3],'XTickLabels', {'Case 1', 'Case 2','Case 3'});
set(gca,'FontSize',24);
box on;
axis square;
save2pdf('barGraphs/AMASummaryBarGraph.pdf');
close;
