table = [pelvic_incidence pelvic_tiltnumeric lumbar_lordosis_angle sacral_slope pelvic_radius degree_spondylolisthesis];
%table = [pelvic_incidence pelvic_tilt lumbar_lordosis_angle sacral_slope pelvic_radius degree_spondylolisthesis];
inputTable = table(:, 1:6); % data rows and columns
classTable = class1; % class columns (7th Column)

first210TraingingDataSet = inputTable(1:210, 1:6);
first210TrainingClassSet = classTable(1:210, :);

test100Data = inputTable(211:310, 1:6);
test100Class = classTable(211:310, :);

SVMModel = svmtrain(first210TraingingDataSet,first210TrainingClassSet)

result100Class = svmclassify(SVMModel,test100Data)

TP = 0; % True Positives
TN = 0; % True Negatives
FP = 0; % False Positives
FN = 0; % False Negatives

cnt = 0;

for k=1:length(result100Class)
    cnt = cnt + 1;
    if(result100Class(k) == 1)
        if (test100Class(k) == 1)
            % TRUE POSITIVE
            TP = TP + 1;
        else
            % FALSE POSITIVE
            FP = FP + 1;
        end
     elseif(result100Class(k) == 0)
         if(test100Class(k) == 0)
             % TRUE NEGATIVE
             TN = TN + 1;
         else
             % FALSE NEGATIVE
             FN = FN + 1;
         end
     end
end

disp('TOTAL');
disp(cnt);
disp(TP);
disp(TN);
disp(FP);
disp(FN);
prec = TP/(TP+FP);
accu = (TP+TN)/(TP+TN+FP+FN);
reca = TP/(TP+FN);
disp('Prec, Acc, Recall');
disp(prec*100);
disp(accu*100);
disp(reca*100);


% sv = SVMModel.SupportVectors;
% disp('Support Vectors');
% disp(sv);
% disp('Support Vector Size (Rows Columns)');
% disp(size(sv));
% disp('Support Vector Std Deviation');
% stdDev = std(sv);
% disp(stdDev);
% disp('Support Vector Averages');
% average = mean(sv);
% disp(average);