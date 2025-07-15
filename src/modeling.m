clc; clear; close all;
format compact;

% Importing main processed dataset
readData = readtable('mergedFiles/mergedTable.csv'); 

% Normalizing the dataset
data = normalizedDataset(readData);

% Partitioning Dataset
cv = cvpartition(size(data,1),'HoldOut',0.2);
idx = cv.test;
dataTrain = data(~idx,:);
dataTest = data(idx,:);
testing = dataTest(1:end, 1:end-1);

%% Modeling
%% Decision Tree
model1 = fitctree(dataTrain, 'y');
prediction = predict(model1, testing);
ms = (sum(prediction == table2array(dataTest(:,end))) / size(dataTest,1)) * 100;
fprintf('Decision tree Accuracy: %.2f %% \n', ms)
confusionMatrixAndScores(table2array(dataTest(:,end)), prediction, 'Confusion Matrix For Per-Second Data using Decision Tree')

%% Random Forest
model2 = fitensemble(dataTrain, 'y', 'Bag', 70, 'Tree', 'Type', 'classification');
prediction = predict(model2, testing);
ms = (sum(prediction == table2array(dataTest(:,end))) / size(dataTest,1)) * 100;
fprintf('Random Forest Accuracy: %.2f %% \n', ms)
confusionMatrixAndScores(table2array(dataTest(:,end)), prediction, 'Confusion Matrix For Per-Second Data using Random Forest')

%% Final test over all the files by Decision Tree
model = model1;
actual_output = [zeros(1,400), ones(1,100)];
predictions = testWithAllFiles(model);
confusionMatrixAndScores(actual_output, predictions, 'Overall Confusion Matrix For Decision Tree (500 Files)')

%% Final test over all the files by Random Forest
model = model2;
actual_output = [zeros(1,400), ones(1,100)];
predictions = testWithAllFiles(model);
confusionMatrixAndScores(actual_output, predictions, 'Overall Confusion Matrix For Random Forest (500 Files)')

%% Final test over unseen data by Decision Tree
model = model1;
actual_output = [zeros(1,40), ones(1,10)];
predictions = testWithTestingFiles(model);
confusionMatrixAndScores(actual_output, predictions, 'Confusion Matrix of Test Files For Decision Tree (50 Files)')

%% Final test over unseen data by Random Forest
model = model2;
actual_output = [zeros(1,40), ones(1,10)];
predictions = testWithTestingFiles(model);
confusionMatrixAndScores(actual_output, predictions, 'Confusion Matrix of Test Files For Random Forest (50 Files)')
