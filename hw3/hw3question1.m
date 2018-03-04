clear;
bcpTable = readtable('bcp.xlsx');
dataTable = bcpTable(:, 4:35);
classTable = bcpTable(:,2);
classTable = table2cell(classTable);
dataTable = table2array(dataTable);

decTree = fitctree(dataTable, classTable);
cvtree = crossval(decTree,'KFold',4);
L = kfoldLoss(cvtree)

% model1 = cvtree.Trained{1};
% model2 = cvtree.Trained{2};
% model3 = cvtree.Trained{3};
% model4 = cvtree.Trained{4};

% view(decTree,'mode','graph');
for i = 1:4;
    modelResults = predict(cvtree.Trained{i},dataTable);
    disp(i)

    TP = 0; % True Positives
    TN = 0; % True Negatives
    FP = 0; % False Positives
    FN = 0; % False Negatives

    rValues = 0; % reccurent
    nValues = 0; % nonreccurent
    total = 0;

    for k=1:length(modelResults)
        total = total + 1;
        if(strcmp(modelResults{k},'N'))
            nValues = nValues + 1;
            if (strcmp(classTable{k}, 'N'))
                % TRUE POSITIVE
                TP = TP + 1;
            else
                % FALSE POSITIVE
                FP = FP + 1;
            end
        elseif(strcmp(modelResults{k},'R'))
            rValues = rValues + 1;
            if(strcmp(classTable{k},'R'))
                % TRUE NEGATIVE
                TN = TN + 1;
            else
                % FALSE NEGATIVE
                FN = FN + 1;
            end
        end
    end

    disp('Assertion')
    disp(rValues + nValues);
    disp(total)
    disp('DATA')
    % disp(TP);
    % disp(TN);
    % disp(FP);
    % disp(FN);
    prec = TP/(TP+FP);
    accu = (TP+TN)/(TP+TN+FP+FN);
    reca = TP/(TP+FN);
    disp('Prec')
    disp(prec*100);
    disp('Acc')
    disp(accu*100);
    disp('Recall')
    disp(reca*100);

    TP = 0; % True Positives
    TN = 0; % True Negatives
    FP = 0; % False Positives
    FN = 0; % False Negatives

    rValues = 0; % reccurent
    nValues = 0; % nonreccurent
    total = 0;

    for k=1:length(modelResults)
        total = total + 1;
        if(strcmp(modelResults{k},'R'))
            nValues = nValues + 1;
            if (strcmp(classTable{k}, 'R'))
                % TRUE POSITIVE
                TP = TP + 1;
            else
                % FALSE POSITIVE
                FP = FP + 1;
            end
        elseif(strcmp(modelResults{k},'N'))
            rValues = rValues + 1;
            if(strcmp(classTable{k},'N'))
                % TRUE NEGATIVE
                TN = TN + 1;
            else
                % FALSE NEGATIVE
                FN = FN + 1;
            end
        end
    end

    disp('Assertion')
    disp(rValues + nValues);
    disp(total)
    disp('DATA')
    % disp(TP);
    % disp(TN);
    % disp(FP);
    % disp(FN);
    prec = TP/(TP+FP);
    accu = (TP+TN)/(TP+TN+FP+FN);
    reca = TP/(TP+FN);
    disp('Prec')
    disp(prec*100);
    disp('Acc')
    disp(accu*100);
    disp('Recall')
    disp(reca*100);
end;