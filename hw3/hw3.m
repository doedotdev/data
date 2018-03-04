clear; clc;
bcpTable = readtable('bcp.xlsx');
dataTable = bcpTable(:, 4:35);
classTable = bcpTable(:,2);
classTable = table2cell(classTable)
dataTable = table2array(dataTable)

decTree = fitctree(dataTable, classTable);