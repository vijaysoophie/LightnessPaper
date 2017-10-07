% This script plots the RMES v/s the number of eigenvalues used for 
% lightness estimation. We plot the RMSE for AMA and SVD cases together in
% one figure.
% The script first loads all data and then plots the RMSE.
%
% VS wrote this Oct 7 2017.

% Load the files
clear all;
results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case9SVDResults.mat']);
results9SVD = results.case9Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case10SVDResults.mat']);
results10SVD = results.case10Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case12SVDResults.mat']);
results12SVD = results.case12Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/SVDOutputs/case12RotatedSVDResults.mat']);
results12RSVD = results.case12Rotated;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case9.mat']);
results9AMA = results.case9Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case10.mat']);
results10AMA = results.case10Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case12.mat']);
results12AMA = results.case12Output;

results = load(['/Users/vijaysingh_local/Desktop/codesAndData/Color/AMAOutputs/SGD/Case12Rotated.mat']);
results12RAMA = results.case12Rotated;

%%
% Make the directory where the figures will be stored
if (~exist('RMSEvsNEigVals','dir'))
    mkdir('RMSEvsNEigVals');
end

% Define the colors to be used for each method
color9SVD  = '--k';
color10SVD = '--b';
color12SVD = '--r';
color9AMA  = 'k';
color10AMA = 'b';
color12AMA = 'r';

% Plot the contrast estimates
fig = figure;
set(fig,'units','pixels', 'Position', [1 1 500 500]);
hold on;
axis square

nEigVecs = 16;
% SVD Results
l9SVD = plot([1:nEigVecs],results9SVD.Case9error(1:nEigVecs),color9SVD,'linewidth',2);
l10SVD = plot([1:nEigVecs],results10SVD.Case10error(1:nEigVecs),color10SVD,'linewidth',2);
l12SVD = plot([1:nEigVecs],results12SVD.Case12error(1:nEigVecs),color12SVD,'linewidth',2);

% AMA Results
l9AMA = plot([1:8],results9AMA.error(1:8),color9AMA,'linewidth',2);
l10AMA = plot([1:nEigVecs],results10AMA.error(1:nEigVecs),color10AMA,'linewidth',2);
l12AMA = plot([1:nEigVecs],results12AMA.error(1:nEigVecs),color12AMA,'linewidth',2);

xlim([1 nEigVecs])
xlabel('N Filters Used');
ylabel('Relative RMSE');
box on;

set(gca, 'fontsize', 20);
legend([l9SVD l9AMA l10SVD l10AMA l12SVD l12AMA],{'Case 1 SVD', 'Case 2 SVD', 'Case 3 SVD', ...
    'Case 1 AMA', 'Case 2 AMA', 'Case 3 AMA'});
set(gca,'FontName','TimesNewRoman','FontSize',24);

save2pdf('RMSEvsNEigVals/RMSEvsNFilters16.pdf',fig,600);

%% Figure upto the 8th eigenvalue
nEigVecs = 8;

xlim([1 nEigVecs])

save2pdf('RMSEvsNEigVals/RMSEvsNFilters8.pdf',fig,600);
close;