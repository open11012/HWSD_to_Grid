clc
clear ;
close all;
[Data,R] = geotiffread('hwsd_tif.tif'); 
info = geotiffinfo('hwsd_tif.tif');
HWSD_DATA = xlsread('HWSD_DATA_reset.xls');
num = unique(Data);
mu_global = HWSD_DATA (:,4); % mu_global  code
%% find the attribute column in HWSD_DATA_reset.xls. Here we use T_bulk_density for example
% T_sand = HWSD_DATA (:,18);
% T_silt = HWSD_DATA (:,19);
% T_clay = HWSD_DATA (:,20);
T_bulk_density = HWSD_DATA (:,22); %find the attribute column
% sand = uint16(zeros(size(Data)));
% silt = uint16(zeros(size(Data)));
% clay = uint16(zeros(size(Data)));
%% You need to find the data format of the attribute, and you need to set the matrix as the same way.
bulk_density = double(zeros(size(Data)));
for i=1:16328
    value = mu_global(i);
    local = find(Data==value);
    %     sand(local) = T_sand(i);
    %     silt(local) = T_silt(i);
    %     clay(local) = T_clay(i);
    bulk_density(local) = T_bulk_density(i);
end
geotiffwrite('bulk_density.tif',bulk_density,R, 'GeoKeyDirectoryTag', info.GeoTIFFTags.GeoKeyDirectoryTag);

% Hwsd_reset = cat(3,sand,silt,clay);
% geotiffwrite('HWSD_SSC1.tif',Hwsd_reset,R, 'GeoKeyDirectoryTag', info.GeoTIFFTags.GeoKeyDirectoryTag);
% figure,imshow(sand);