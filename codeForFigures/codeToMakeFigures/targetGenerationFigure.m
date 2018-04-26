% Illuminance Generation example

% Clear
% clear; %close all;

% Desired wl sampling
luminanceLevels = [0.2:0.4/9:0.6];
reflectanceNumbers = (1:10);
nSurfaceAtEachLuminace = 10;

S = [400 5 61];
theWavelengths = SToWls(S);
% Munsell surfaces
load sur_nickerson
sur_nickerson = SplineSrf(S_nickerson,sur_nickerson,S);

% Vhrel surfaces
load sur_vrhel 
sur_vrhel = SplineSrf(S_vrhel,sur_vrhel,S);

% Put them together
sur_all = [sur_nickerson sur_vrhel];
sur_mean=mean(sur_all,2);
sur_all_mean_centered = bsxfun(@minus,sur_all,sur_mean);

%% Analyze with respect to a linear model
B = FindLinMod(sur_all_mean_centered,6);
sur_all_wgts = B\sur_all_mean_centered;
mean_wgts = mean(sur_all_wgts,2);
cov_wgts = cov(sur_all_wgts');

%% Load in the T_xyz1931 data for luminance sensitivity
theXYZData = load('T_xyz1931');
theLuminanceSensitivity = SplineCmf(theXYZData.S_xyz1931,theXYZData.T_xyz1931(2,:),theWavelengths);

theIlluminantData = load('spd_D65');
theIlluminant = SplineSpd(theIlluminantData.S_D65,theIlluminantData.spd_D65,theWavelengths);
theIlluminant = theIlluminant/(theLuminanceSensitivity*theIlluminant);


%% Generate new surfaces
targetSurfaces = zeros(S(3),size(luminanceLevels,2)*nSurfaceAtEachLuminace);
newIndex = 1;

m=0;
for i = 1:(size(luminanceLevels,2)*nSurfaceAtEachLuminace)
    m=m+1;
    OK = false;
    while (~OK)
        ran_wgts = mvnrnd(mean_wgts',cov_wgts)';
        theReflectance = B*ran_wgts+sur_mean;
        theLightToEye = theIlluminant.*theReflectance;
        theLuminance = theLuminanceSensitivity*theLightToEye;
        theLuminanceTarget = luminanceLevels(ceil(i/nSurfaceAtEachLuminace));
        scaleFactor = theLuminanceTarget / theLuminance;
        theReflectanceScaled = scaleFactor * theReflectance;
        if (all(theReflectanceScaled >= 0) & all(theReflectanceScaled <= 1))
            targetSurfaces(:,newIndex) = theReflectanceScaled;
            newIndex = newIndex+1;
            OK = true;
        end
    end
%     reflectanceName = sprintf('luminance-%.4f-reflectance-%03d.spd', theLuminanceTarget, ...
%                 reflectanceNumbers(m));
%     fid = fopen(fullfile(folderToStore,reflectanceName),'w');
%     fprintf(fid,'%3d %3.6f\n',[theWavelengths,theReflectanceScaled]');
%     f%close(fid);
    if (m==numel(reflectanceNumbers)) m=0; end
end

%% Load in the T_xyz1931 data for luminance sensitivity
theXYZData = load('T_xyz1931');
theLuminanceSensitivity = SplineCmf(theXYZData.S_xyz1931,theXYZData.T_xyz1931,theWavelengths);
theLuminanceSensitivityIll = SplineCmf(theXYZData.S_xyz1931,theXYZData.T_xyz1931,theWavelengths);

%% Compute XYZ
TargetXYZ = theLuminanceSensitivity*targetSurfaces;
TargetxyY = XYZToxyY(TargetXYZ);
XYZsurAll = theLuminanceSensitivity*sur_all;
xyYSurall = XYZToxyY(XYZsurAll);

%% Convert to linear SRGB
SRGBPrimaryIll = XYZToSRGBPrimary(TargetXYZ);% Primary Illuminance 
SRGBPrimaryNormIll = SRGBPrimaryIll/max(SRGBPrimaryIll(:));
SRGBIll = SRGBGammaCorrect(SRGBPrimaryNormIll,false)/255;
    
%% Reshape the matrices for plotting as squares

for ii =1 :10
    for jj= 1:10
        thetargetReflectanceImage(ii,jj,:)=SRGBIll(:,(ii-1)*10+jj);
    end
end

% %% Plot figures
% FS = 20;
% FSTitle = 15;
% 
% fig=figure;
% set(fig,'Position', [100, 100,550, 500]);
% hold on;
% box on; axis square;
% fig1 = plot(SToWls(S),sur_all);
% % title('Natural Surface Spectra','FontSize',FSTitle);
% xlabel('$\lambda (nm)$','interpreter','latex','FontSize',FS);
% ylabel('$R(\lambda)$','interpreter','latex','FontSize',FS)
% set(gca,'FontSize',FS);
% ylimit=get(gca,'ylim');
% %save2pdf('Figure14_a.pdf',fig,600);
% %close;
% 
% 
% fig=figure;
% set(fig,'Position', [100, 100,550, 500]);
% hold on;
% box on; axis square;
% plot(SToWls(S),targetSurfaces);
% ylim(ylimit);
% % title('Randomly Target Reflectance','FontSize',FSTitle);
% xlabel('$\lambda (nm)$','interpreter','latex','FontSize',FS);
% ylabel('$\tilde{R}(\lambda)$','interpreter','latex','FontSize',FS)
% set(gca,'FontSize',FS);
% %save2pdf('Figure14_b.pdf',fig,600);
% %close;
% 
% %% 
% fig=figure;
% set(fig,'Position', [100, 100,550, 500]);
% hold on;
% box on; axis square;
% image(thetargetReflectanceImage);
% % title('sRGB Rendition of $\tilde{R}(\lambda)$','interpreter','latex','FontSize',FSTitle);
% set(gca,'FontSize',FS);
% currentaxes= gca;
% xlim([0.5 10.5]);
% ylim([0.5 10.5]);
% yticks([1:10]);
% xticks([1:10]);
% currentaxes.YTickLabel=round(luminanceLevels,2);
% xlabel('Reflectance Index');
% ylabel('Y');
% %save2pdf('Figure14_c.pdf',fig,600);
% %close;
