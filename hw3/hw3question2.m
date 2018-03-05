clc;clear;

bcpTable = readtable('bcp.xlsx');

trainDataTable = bcpTable(1:132, 4:35);
testDataTable = table2cell(bcpTable(133:198, 4:35));
trainClassTable = table2cell(bcpTable(1:132, 3));
testClassTable = table2cell(bcpTable(133:198, 3));

% classTable = table2cell(classTable);
% dataTable = table2array(dataTable);

% tree = fitrtree(trainDataTable, trainClassTable);

% Linear Regression for a single X, Y
trainSingleData = table2array(bcpTable(1:132, 4)); % just for column 4
trainSingleClass = table2array(bcpTable(1:132, 3));
tempSumDataClass = trainSingleData.*trainSingleClass;
tempDataSquared = trainSingleData .* trainSingleData;
tempClassSquared = trainSingleClass .* trainSingleClass;
newTable = [trainSingleData, trainSingleClass, tempSumDataClass,tempDataSquared, tempClassSquared];
sumTable = sum(newTable);

n = length(trainSingleClass) % dont hardcode this homie


aNumerator = (sumTable(2) * sumTable(4)) - (sumTable(1)*sumTable(3));
aDenominator = n*sumTable(4)- sumTable(1).^2;
aValue = aNumerator/aDenominator

bNumerator = n*sumTable(3)-(sumTable(1)*sumTable(2));
bValue = bNumerator/aDenominator

disp('Y = a + b*X')


% confirm

[r,m,b] = regress(trainSingleData,trainSingleClass)