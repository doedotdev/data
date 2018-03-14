clc;clear;

bcpTable = readtable('bcp.xlsx');

trainDataTable = table2array(bcpTable(1:132, 4:35));
testDataTable = table2array(bcpTable(133:198, 4:35));
trainClassTable = table2array(bcpTable(1:132, 3));
testClassTable = table2array(bcpTable(133:198, 3));

coeffs = [];
for i = 1:32
   temp = corrcoef(trainDataTable(:,i), trainClassTable, 'rows','complete');
   coeffs = [coeffs, temp(2,1)];
end

% now predict based off of the above values
answers = [];
for i = 1:length(testDataTable)
    testData = testDataTable(i,:);
    testData(isnan(testData))=0;
    tempMultArray = testData.*coeffs;
    answers = [answers, sum(tempMultArray)];
end

diffs = [];
for i = 1:66
    diff = (testClassTable(i) - answers(i));
    diffs = [diffs, diff];
end

