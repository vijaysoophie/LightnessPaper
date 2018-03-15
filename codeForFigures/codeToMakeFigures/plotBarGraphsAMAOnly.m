% This script plots the RMSE bar graphs for the linear and AMA 
% methods. 
% Three bar graphs are produced.
% 1. Case 1: Naive, Linear, AMA RF Case1 AMA RF Case2 AMA RF Case3
% 2. Case 2: Naive, Linear, AMA RF Case1 AMA RF Case2 AMA RF Case3
% 3. Case 3: Naive, Linear, AMA RF Case1 AMA RF Case2 AMA RF Case3
%
% VS wrote this Nov 8 2017


% Load the results for all cases
% SVD Results
clear;
% results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case9SVDResults.mat']);
% results9SVD = results.case9Output;
% 
% results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case10SVDResults.mat']);
% results10SVD = results.case10Output;
% 
% results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case12SVDResults.mat']);
% results12SVD = results.case12Output;
% 
% results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case12RotatedSVDResults.mat']);
% results12RSVD = results.case12Rotated;

% AMA Results
results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD2/Case9.mat']);
results9AMA = results.case9Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD2/Case10.mat']);
results10AMA = results.case10Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD2/Case11.mat']);
results11AMA = results.case11Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD2/Case12.mat']);
results12AMA = results.case12Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD2/Case12Rotated.mat']);
results12RAMA = results.case12Rotated;

% Linear Results

linearCase9 = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/Case9_AMAIsomerization.mat');
linearCase10 = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/case10.mat');
linearCase11 = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/Case11_AMAIsomerization.mat');
linearCase12 = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/case12.mat');
% linearCase12R = load('/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/case12.mat');

%%
% Make the directory where the figures will be stored
if (~exist('barGraphs2','dir'))
    mkdir('barGraphs2');
end

% Define the colors to be used for each method
naiveColor  = 'g';
linearColor = 'k';   
AMAColor1    = 'r';
AMAColor2    = 'b';
AMAColor3    = 'y';
AMAColor4    = 'm';

%% Case 1
% Plot the bars corresponding to RMSE 
fig2 = figure;
set(fig2,'units','pixels', 'Position', [1 1 500 500]);
hold on;
naiveRelRMSE = sqrt(mean(((linspace(0.2,0.6,10)-mean(linspace(0.2,0.6,10)))./linspace(0.2,0.6,10)).^2));
hold on;
h2 = bar(1, linearCase9.LinearRMSETest);
h3 = bar(2, results9AMA.Case9error(8));
h4 = bar(3, results11AMA.Case9error(8));
h5 = bar(4, results10AMA.Case9error(8));
h6 = bar(5, results12AMA.Case9error(8));
plot([0 6],[naiveRelRMSE naiveRelRMSE],'--g','LineWidth',4)

set(h2,'FaceColor',linearColor);
set(h3,'FaceColor',AMAColor1);
set(h4,'FaceColor',AMAColor2);
set(h5,'FaceColor',AMAColor3);
set(h6,'FaceColor',AMAColor4);

ylim([0 0.5]);
xlim([1.5 5.5]);
ylabel('$E_{\rm rel}$','interpreter','latex');
% set(gca, 'XTick',[1 2 3 4],'XTickLabels', {'Naive', 'Linear Regression Center Pixel', 'SVD-LDA', 'AMA'},'TickLabelInterpreter','latex');
set(gca, 'XTick',[1 2 3 4 5],'XTickLabels', {'Linear', 'Case 1', 'Case 2', 'Case 3', 'Case 4'},'TickLabelInterpreter','latex');
set(gca,'FontSize',25);
% title('Images of case 1');
box on;
axis square;
save2pdf('barGraphs2/AMAComparisionCase1.pdf',fig2,600);
close;

%% Case 2
% Plot the bars corresponding to RMSE 
fig2 = figure;
set(fig2,'units','pixels', 'Position', [1 1 500 500]);
hold on;
naiveRelRMSE = sqrt(mean(((linspace(0.2,0.6,10)-mean(linspace(0.2,0.6,10)))./linspace(0.2,0.6,10)).^2));
hold on;
h2 = bar(1, linearCase11.LinearRMSETest);
h3 = bar(2, results9AMA.Case11error(8));
h4 = bar(3, results11AMA.Case11error(8));
h5 = bar(4, results10AMA.Case11error(8));
h6 = bar(5, results12AMA.Case11error(8));
plot([0 6],[naiveRelRMSE naiveRelRMSE],'--g','LineWidth',4)

set(h2,'FaceColor',linearColor);
set(h3,'FaceColor',AMAColor1);
set(h4,'FaceColor',AMAColor2);
set(h5,'FaceColor',AMAColor3);
set(h6,'FaceColor',AMAColor4);

ylim([0 0.5]);
xlim([1.5 5.5]);
ylabel('$E_{\rm rel}$','interpreter','latex');
% set(gca, 'XTick',[1 2 3 4],'XTickLabels', {'Naive', 'Linear Regression Center Pixel', 'SVD-LDA', 'AMA'},'TickLabelInterpreter','latex');
set(gca, 'XTick',[1 2 3 4 5],'XTickLabels', {'Linear', 'Case 1', 'Case 2', 'Case 3', 'Case 4'},'TickLabelInterpreter','latex');
set(gca,'FontSize',25);
% title('Case 1');
box on;
axis square;
save2pdf('barGraphs2/AMAComparisionCase2.pdf',fig2,600);
close;

%% Case 3
% Plot the bars corresponding to RMSE 
fig2 = figure;
set(fig2,'units','pixels', 'Position', [1 1 500 500]);
hold on;
naiveRelRMSE = sqrt(mean(((linspace(0.2,0.6,10)-mean(linspace(0.2,0.6,10)))./linspace(0.2,0.6,10)).^2));
hold on;
h2 = bar(1, linearCase10.cNormLinearRMSETest);
h3 = bar(2, results9AMA.Case10error(8));
h4 = bar(3, results11AMA.Case10error(8));
h5 = bar(4, results10AMA.Case10error(8));
h6 = bar(5, results12AMA.Case10error(8));
plot([0 6],[naiveRelRMSE naiveRelRMSE],'--g','LineWidth',4)

set(h2,'FaceColor',linearColor);
set(h3,'FaceColor',AMAColor1);
set(h4,'FaceColor',AMAColor2);
set(h5,'FaceColor',AMAColor3);
set(h6,'FaceColor',AMAColor4);

ylim([0 0.5]);
xlim([1.5 5.5]);
ylabel('$E_{\rm rel}$','interpreter','latex');
% set(gca, 'XTick',[1 2 3 4],'XTickLabels', {'Naive', 'Linear Regression Center Pixel', 'SVD-LDA', 'AMA'},'TickLabelInterpreter','latex');
set(gca, 'XTick',[1 2 3 4 5],'XTickLabels', {'Linear', 'Case 1', 'Case 2', 'Case 3', 'Case 4'},'TickLabelInterpreter','latex');
set(gca,'FontSize',25);
% title('Case 1');
box on;

axis square;
save2pdf('barGraphs2/AMAComparisionCase3.pdf',fig2,600);
close;

%% Case 3
% Plot the bars corresponding to RMSE 
fig2 = figure;
set(fig2,'units','pixels', 'Position', [1 1 500 500]);
hold on;
naiveRelRMSE = sqrt(mean(((linspace(0.2,0.6,10)-mean(linspace(0.2,0.6,10)))./linspace(0.2,0.6,10)).^2));
hold on;
h2 = bar(1, linearCase12.cNormLinearRMSETest);
h3 = bar(2, results9AMA.Case12error(8));
h4 = bar(3, results11AMA.Case12error(8));
h5 = bar(4, results10AMA.Case12error(8));
h6 = bar(5, results12AMA.Case12error(8));
plot([0 6],[naiveRelRMSE naiveRelRMSE],'--g','LineWidth',4)

set(h2,'FaceColor',linearColor);
set(h3,'FaceColor',AMAColor1);
set(h4,'FaceColor',AMAColor2);
set(h5,'FaceColor',AMAColor3);
set(h6,'FaceColor',AMAColor4);

ylim([0 0.5]);
xlim([1.5 5.5]);
ylabel('$E_{\rm rel}$','interpreter','latex');
% set(gca, 'XTick',[1 2 3 4],'XTickLabels', {'Naive', 'Linear Regression Center Pixel', 'SVD-LDA', 'AMA'},'TickLabelInterpreter','latex');
set(gca, 'XTick',[1 2 3 4 5],'XTickLabels', {'Linear', 'Case 1', 'Case 2', 'Case 3', 'Case 4'},'TickLabelInterpreter','latex');
set(gca,'FontSize',25);
% title('Case 1');
box on;

axis square;
save2pdf('barGraphs2/AMAComparisionCase4.pdf',fig2,600);
close;
