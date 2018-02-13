table = [pelvic_incidence pelvic_tiltnumeric lumbar_lordosis_angle sacral_slope pelvic_radius degree_spondylolisthesis];
%table = [pelvic_incidence pelvic_tilt lumbar_lordosis_angle sacral_slope pelvic_radius degree_spondylolisthesis];
inputTable = table(:, 1:6); % data rows and columns
classTable = class1; % class columns (7th Column)

first210TraingingDataSet = inputTable(1:210, 1:6);
first210TrainingClassSet = classTable(1:210, :);

test100Data = inputTable(211:310, 1:6);
test100Class = classTable(211:310, :);
disp('--------------------------------------');
model = svmtrain(first210TraingingDataSet,first210TrainingClassSet,'kernel_function','rbf');
disp(model);
disp('--------------------------------------');
disp('svmtrain - SupportVectors:');
disp('Matrix of data points with each row corresponding to a support vector in the normalized data space. This matrix is a subset of the Training input data matrix, after normalization has been applied according to the AutoScale argument.');
disp(model.SupportVectors);
disp('svmtrain - Alpha:');
disp('Vector of weights for the support vectors. The sign of the weight is positive for support vectors belonging to the first group, and negative for the second group.');
disp(model.Alpha);
disp('svmtrain - Bias:');
disp('Intercept of the hyperplane that separates the two groups in the normalized data space (according to the AutoScale argument).');
disp(model.Bias);
disp('svmtrain - KernelFunction:');
disp(model.KernelFunction);
disp('svmtrain - KernelFunctionArgs:');
disp(model.KernelFunctionArgs);
disp('svmtrain - GroupNames:');
disp(model.GroupNames);
disp('svmtrain - SupportVectorIndices:');
disp(model.SupportVectorIndices);
disp('svmtrain - ScaleData:');
disp(model.ScaleData);
disp('svmtrain - FigureHandles:');
disp(model.FigureHandles);

disp('--------------------------------------');
header = {'Col 1','Col 2','Col 3','Col 4','Col 5','Col 6','Class + OR -'};
svmMatrix = [model.SupportVectors model.Alpha];
smMatrixWithHeader = [header; num2cell(svmMatrix)];
disp(smMatrixWithHeader);

positiveVectorClass = 0;
negativeVectorClass = 0;
otherClass = 0; % thisd should be 0
for k=1:length(model.Alpha)
    if(model.Alpha(k) > 0)
        positiveVectorClass = positiveVectorClass + 1;
    elseif(model.Alpha(k) < 0)
        negativeVectorClass = negativeVectorClass + 1;
    else
        
    end
end
disp('positiveVectorClass')
disp(positiveVectorClass)
disp('negativeVectorClass');
disp(negativeVectorClass);
disp('otherClass + net diff should be 0');
x = size(model.Alpha);
net = otherClass + x(1) - positiveVectorClass - negativeVectorClass;
disp(net);



disp('--------------------------------------');
result100Class = svmclassify(model,test100Data);

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
disp('--------------------------------------');
disp('TOTAL');
disp(cnt);
disp('True Positive');
disp(TP);
disp('True Negative');
disp(TN);
disp('False Positive');
disp(FP);
disp('False Negative');
disp(FN);
prec = TP/(TP+FP);
accu = (TP+TN)/(TP+TN+FP+FN);
reca = TP/(TP+FN);
disp('Prec, Acc, Recall');
disp(prec*100);
disp(accu*100);
disp(reca*100);