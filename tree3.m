% table = [pelvic_incidence pelvic_tiltnumeric lumbar_lordosis_angle sacral_slope pelvic_radius degree_spondylolisthesis];
table = [pelvic_incidence pelvic_tilt lumbar_lordosis_angle sacral_slope pelvic_radius degree_spondylolisthesis];
inputTable = table(:, 1:6); % data rows and columns
classTable = class1; % class columns (7th Column)

first210TraingingDataSet = inputTable(1:210, 1:6);
first210TrainingClassSet = classTable(1:210, :);

test100Data = inputTable(211:310, 1:6);
test100Class = classTable(211:310, :);

decTree = fitctree(inputTable, classTable, 'MinLeafSize',10);

% Run Data through the decision tree we made
resultsOfTestSet = predict(decTree,test100Data);

TP = 0; % True Positives
TN = 0; % True Negatives
FP = 0; % False Positives
FN = 0; % False Negatives
Norm = 0;
Spon = 0;
Hern = 0;

for k=1:length(resultsOfTestSet)
    if(strcmp(resultsOfTestSet{k},'Normal'))
        Norm = Norm + 1;
        if (strcmp(test100Class{k}, 'Normal'))
            % TRUE POSITIVE
            TP = TP + 1; % Ok
        else
            % FALSE POSITIVE
            FP = FP + 1;
        end
    elseif(strcmp(resultsOfTestSet{k},'Spondylolisthesis'))
        Spon = Spon + 1;
        if (strcmp(test100Class{k}, 'Spondylolisthesis'))
            % True Negative POSITIVE
            TN = TN + 1; % Ok
        else
            % FALSE Negative
            FN = FN + 1;
        end
    elseif(strcmp(resultsOfTestSet{k},'Hernia'))
        Hern = Hern + 1;
        if (strcmp(test100Class{k}, 'Hernia'))
            % TRUE Negative
            TN = TN+ 1; % Ok
        else
            % False Negative
            FN = FN + 1;
        end
    end
end
disp('total norm');
disp(Norm + Spon + Hern);
% disp(TP);
% disp(TN);
% disp(FP);
% disp(FN);
prec = TP/(TP+FP);
accu = (TP+TN)/(TP+TN+FP+FN);
reca = TP/(TP+FN);
disp(prec*100);
disp(accu*100);
disp(reca*100);

TP = 0; % True Positives
TN = 0; % True Negatives
FP = 0; % False Positives
FN = 0; % False Negatives
Norm = 0;
Spon = 0;
Hern = 0;

for k=1:length(resultsOfTestSet)
    if(strcmp(resultsOfTestSet{k},'Spondylolisthesis'))
        Norm = Norm + 1;
        if (strcmp(test100Class{k}, 'Spondylolisthesis'))
            % TRUE POSITIVE
            TP = TP + 1; % Ok
        else
            % FALSE POSITIVE
            FP = FP + 1;
        end
    elseif(strcmp(resultsOfTestSet{k},'Normal'))
        Spon = Spon + 1;
        if (strcmp(test100Class{k}, 'Normal'))
            % True Negative POSITIVE
            TN = TN + 1; % Ok
        else
            % FALSE Negative
            FN = FN + 1;
        end
    elseif(strcmp(resultsOfTestSet{k},'Hernia'))
        Hern = Hern + 1;
        if (strcmp(test100Class{k}, 'Hernia'))
            % TRUE Negative
            TN = TN+ 1; % Ok
        else
            % False Negative
            FN = FN + 1;
        end
    end
end
disp('total Spon');
disp(Norm + Spon + Hern);
% disp(TP);
% disp(TN);
% disp(FP);
% disp(FN);
prec = TP/(TP+FP);
accu = (TP+TN)/(TP+TN+FP+FN);
reca = TP/(TP+FN);
disp(prec*100);
disp(accu*100);
disp(reca*100);

TP = 0; % True Positives
TN = 0; % True Negatives
FP = 0; % False Positives
FN = 0; % False Negatives
Norm = 0;
Spon = 0;
Hern = 0;

for k=1:length(resultsOfTestSet)
    if(strcmp(resultsOfTestSet{k},'Hernia'))
        Norm = Norm + 1;
        if (strcmp(test100Class{k}, 'Hernia'))
            % TRUE POSITIVE
            TP = TP + 1; % Ok
        else
            % FALSE POSITIVE
            FP = FP + 1;
        end
    elseif(strcmp(resultsOfTestSet{k},'Normal'))
        Spon = Spon + 1;
        if (strcmp(test100Class{k}, 'Normal'))
            % True Negative POSITIVE
            TN = TN + 1; % Ok
        else
            % FALSE Negative
            FN = FN + 1;
        end
    elseif(strcmp(resultsOfTestSet{k},'Spondylolisthesis'))
        Hern = Hern + 1;
        if (strcmp(test100Class{k}, 'Spondylolisthesis'))
            % TRUE Negative
            TN = TN+ 1; % Ok
        else
            % False Negative
            FN = FN + 1;
        end
    end
end
disp('total Hern');
disp(Norm + Spon + Hern);
% disp(TP);
% disp(TN);
% disp(FP);
% disp(FN);
prec = TP/(TP+FP);
accu = (TP+TN)/(TP+TN+FP+FN);
reca = TP/(TP+FN);
disp(prec*100);
disp(accu*100);
disp(reca*100);

