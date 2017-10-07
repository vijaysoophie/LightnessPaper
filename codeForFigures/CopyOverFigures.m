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

% Figure2: Psychophysical data
analysisOutputFigDir = fullfile(outputBaseDir,'xPsychoBasic','parametricConditions2','c32_pnt_rot0_shad4_blk40_cen40_vs_shd_rot0_shad4_blk40_cen40_t1/aqr/');
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'aqr-c32_pnt_rot0_shad4_blk40_cen40_vs_shd_rot0_shad4_blk40_cen40_t1-2_exampleOne.eps') ' ' fullfile(figureDir,'Figure2A_PsychometricFunctionExample.eps')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Summary_gain_aqr_32_example.eps') ' ' fullfile(figureDir,'Figure2B_PaintShadowEffectExample.eps')];
unix(copyCmd);
analysisOutputFigDir = fullfile(outputBaseDir,'xPsychoSummary','gain');
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'OriginalPaintShadowGainsWithControl.eps') ' ' fullfile(figureDir,'Figure2C_PaintShadowEffectSummary.eps')];
unix(copyCmd);

% Figure 5B: Average psychophyical probability correct figure
analysisOutputFigDir = fullfile(outputBaseDir,'xPsychoSummary','Gain');
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'OriginalPaintShadowAverageProbCorrect.eps') ' ' fullfile(figureDir,'Figure5B_AveragePsychoProbCorrect.eps')];
unix(copyCmd);

%% Physiology
%
% Cd to popdecode.  Run ProprocessRunAll; ExtractedRunAll; SummarizeRunAll;

% Figure 6: PCA projection example, panels B-D.  These are figures similar
% to ones Marlene made, but hers are cross-validated and we used those in the 
% paper.
%
% analysisOutputFigDir = fullfile(outputBaseDir,'xExtractedPlots','aff_cls-mvmaSMO_pca-no_notshf_nopsshf_sykp_ft-gain_2_1','ST140424lightness0001_225px_-1cx_-80cy_g');
% copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Fig_extRMSEVersusNPCAPaintShadowMeanOnPCABoth1_2.pdf') ' ' fullfile(figureDir,'Figure6B_MeanOnPCABoth.pdf')];
% unix(copyCmd);
% copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Fig_extRMSEVersusNPCAPaintShadowMeanOnPCAPaintOnly1_2.pdf') ' ' fullfile(figureDir,'Figure6C_MeanOnPCAPaint.pdf')];
% unix(copyCmd);
% copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Fig_extRMSEVersusNPCAPaintShadowMeanOnPCAShadowOnly1_2.pdf') ' ' fullfile(figureDir,'Figure6D_MeanOnPCAShadow.pdf')];
% unix(copyCmd);

% Figure 7: Decoding and neural paint/shadow effect
analysisOutputFigDir = fullfile(outputBaseDir,'xExtractedPlots','aff_cls-mvmaSMO_pca-no_notshf_nopsshf_sykp_ft-gain_2_1','JD130904lightness0001_300px_15cx_-25cy_i');
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Fig_extPaintShadowEffectDecodeBothDecoding.eps') ' ' fullfile(figureDir,'Figure7A_ExampleDecoding1.eps')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Fig_extPaintShadowEffectDecodeBothInferredMatches.eps') ' ' fullfile(figureDir,'Figure7B_ExamplePaintShadowEffect1.eps')];
unix(copyCmd);
analysisOutputFigDir = fullfile(outputBaseDir,'xExtractedPlots','aff_cls-mvmaSMO_pca-no_notshf_nopsshf_sykp_ft-gain_2_1','ST140703lightness0001_115px_-15cx_-72cy_g');
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Fig_extPaintShadowEffectDecodeBothDecoding.eps') ' ' fullfile(figureDir,'Figure7C_ExampleDecoding2.eps')];
unix(copyCmd);
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Fig_extPaintShadowEffectDecodeBothInferredMatches.eps') ' ' fullfile(figureDir,'Figure7D_ExamplePaintShadowEffect2.eps')];
unix(copyCmd);

% Figure 8: Envelope decoding
analysisOutputFigDir = fullfile(outputBaseDir,'xExtractedPlots','aff_cls-mvmaSMO_pca-no_notshf_nopsshf_sykp_ft-gain_2_1','ST140703lightness0001_115px_-15cx_-72cy_g/');
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'Fig_extPaintShadowEffectRMSEEnvelope.eps') ' ' fullfile(figureDir,'Figure8A_SingleSessionEnvelope.eps')];
unix(copyCmd);
analysisOutputFigDir = fullfile(outputBaseDir,'xSummary','aff_cls-mvmaSMO_pca-no_notshf_nopsshf_sykp_ft-gain_2_1','PaintShadowEffect');
copyCmd = ['cp ' fullfile(analysisOutputFigDir,'summaryPaintShadowEnvelopeVsRMSE.eps') ' ' fullfile(figureDir,'Figure8B_PaintShadowEffectSummary.eps')];
unix(copyCmd);

