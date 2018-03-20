clc; clear;

% read in data
wineQualityTable = readtable('winequality-white.csv');

% split data into training (2/3rd) and Test (1/3rd)
trainDataTable = table2array(wineQualityTable(1:3265, 1:11));
testDataTable = table2array(wineQualityTable(3266:4898, 1:11));

trainClassTable = table2array(wineQualityTable(1:3265, 12));
testClassTable = table2array(wineQualityTable(3266:4898, 12));

allDataTable = table2array(wineQualityTable(:, 1:11));
allClassTable = table2array(wineQualityTable(:, 12));

allEverythingTable = [allDataTable, allClassTable];

builderString = 'Node: root w/ MSE: DNE';

myFun(allEverythingTable, 0, 'root', builderString, 'root');