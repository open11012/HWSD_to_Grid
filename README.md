# HWSD_to_Grid
 Extract soil attributes from HWSD through MATLAB
 
It consume too much time when using ArcGis to extract soil attributrs from HWSD.bil to grid, so I used MATLAB to achieve this function.
ALL the data are provied by http://www.fao.org/soils-portal/soil-survey/soil-maps-and-databases/harmonized-world-soil-database-v12/en/

For the files provied by this repository
hwsd_tif.tif:  is converted by HWSD.BIL
HWSD_DATA_reset.xls:  “one to one” relation between the GRID value and the database attribute MU_GLOBAL
hwsd_attribute.m: convert hwsd_tif.tif to one attribute tif file.