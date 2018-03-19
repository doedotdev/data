clc; clear;

% read in data
bcpTable = readtable('bcp.xlsx');

% split data into training (2/3rd) and Test (1/3rd)
trainDataTable = table2array(bcpTable(1:132, 4:35));
testDataTable = table2array(bcpTable(133:198, 4:35));
trainClassTable = table2array(bcpTable(1:132, 3));
testClassTable = table2array(bcpTable(133:198, 3));
allDataTable = table2array(bcpTable(1:198, 4:35));
allClassTable = table2array(bcpTable(1:198, 3));
allEverythingTable = [allDataTable, allClassTable];

% tree = fitrtree(trainDataTable, trainClassTable);
% pred = predict(tree, testDataTable);
% 
% diffsSquared = [];
% for k =1:length(pred)
%     diff = pred(k) - testClassTable(k);
%     diffSquared = diff.^2;
%     diffsSquared = [ diffsSquared, diffSquared];
% end
% 
% MSE = mean(diffsSquared);
% 
% 
% coeffs = [];
% for i = 1:32
%    temp = corrcoef(trainDataTable(:,i), trainClassTable, 'rows','complete');
%    coeffs = [coeffs, temp(2,1)];
% end
% 
% disp('Calculated Coefficients for each row');
% disp(coeffs);
% coeffs = abs(coeffs);
% disp('Best Coefficient Found');
% best = max(coeffs);
% disp('Best Attribute Index in Current Node');
% bestIndex = find(coeffs == best)
% 
% sortDataSetOnAttribute = sortrows(allDataTable, bestIndex);
% dataSetLen = length(sortDataSetOnAttribute);
% part1 = sortDataSetOnAttribute(1:ceil(dataSetLen/2), :);
% part2 = sortDataSetOnAttribute(ceil(dataSetLen)/2+1:end,:);

myFun(allEverythingTable, 0, 'root');

