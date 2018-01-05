% This script plots the lightness estimates vs the actual lighteness for 
% the linear, SVD and AMA methods.
%
% Case 9 - Variable Target shape Fixed Background Fixed Illuminant
% Case 10 - Variable Target shape Fixed Background Variable Illuminant
% Case 12 - Variable Target shape Variable Background Variable Illuminant
%
% VS wrote this Oct7 2017

% Make the directory where the figures will be stored
if (~exist('estimatesVsActualAMA','dir'))
    mkdir('estimatesVsActualAMA');
end

% Choose a case
for caseNo = [ 9 10 12]

% load the files containing the estimates
loadTheLinearFile = load(['/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/linear/Case',num2str(caseNo),'.mat']);
loadTheAMAFile = load(['/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/SGD/case',num2str(caseNo),'.mat']);
loadTheSVDFile = load(['/Users/vijaysingh_local/Dropbox (Personal)/dataForPoster/SVD/case',num2str(caseNo),'.mat']);

% Define the colors to be used for each method
naiveColor  = 'g';
linearColor = 'k';   
AMAColor    = 'r';

% Plot the contrast estimates
fig = figure;
set(fig,'units','pixels', 'Position', [1 1 500 500]);
hold on;
% plot the linear and svd response
lNaive = plot(unique(loadTheAMAFile.XTest)',0.4*ones(size(unique(loadTheAMAFile.XTest)')),naiveColor,'linewidth',2);
lLinear = plot(unique(loadTheAMAFile.XTest)',loadTheLinearFile.cNormMeanEstimateTest,linearColor,'linewidth',2);
% errorbar(unique(loadTheLinearFile.labelsTest)',loadTheLinearFile.cMeanSvdEstimateTest,loadTheLinearFile.cStdSvdEstimateTest,SVDColor,'linewidth',2);
xlim([0.15 0.65]);
ylim([0.15 0.65]);
xlabel('$Y$','interpreter','latex');
ylabel('$\hat{Y}$','interpreter','latex');
box on;

%% This part is for AMA SGD
estimatedL = loadTheAMAFile.XHATi;
estimatedL = reshape(estimatedL,[],10);
meanEstimatedL = mean(estimatedL);
stdEstimatedL = std(estimatedL);
lAMA = plot(linspace(0.2,0.6,10),meanEstimatedL,AMAColor,'linewidth',2);
axis square;
plotfillederror(linspace(0.2,0.6,10),meanEstimatedL-stdEstimatedL,meanEstimatedL+stdEstimatedL,AMAColor);
plotfillederror(linspace(0.2,0.6,10),loadTheLinearFile.cNormMeanEstimateTest-loadTheLinearFile.cNormStdEstimateTest,...
    loadTheLinearFile.cNormMeanEstimateTest+loadTheLinearFile.cNormStdEstimateTest,linearColor);

lDiagonal = plot([0.15 0.65],[0.15 0.65],'b--','linewidth',2);
legend([lNaive, lLinear, lAMA, lDiagonal],...
    {'Naive','Linear Reg.','AMA', 'x=y'}, 'Location','southeast');
 save2pdf(['estimatesVsActualAMA/Case',num2str(caseNo),'Results.pdf'],fig,600);
close;

end
