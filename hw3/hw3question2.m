clc;clear;

bcpTable = readtable('bcp.xlsx');

trainDataTable = bcpTable(1:132, 4:35);
testDataTable = table2cell(bcpTable(133:198, 4:35));
trainClassTable = table2cell(bcpTable(1:132, 3));
testClassTable = table2cell(bcpTable(133:198, 3));

% classTable = table2cell(classTable);
% dataTable = table2array(dataTable);

tree = fitrtree(trainDataTable, trainClassTable);