function [p]= testWithTestingFiles(model)
dir = 'dataset/Sprocessed/';
fileName ='S00';
predictions = [];

for k = ['F','N','O','Z','S']
    preds = [];
    dir(9)= k;
    fileName(1) = k;
    sum = 0;

    for j = 90:99
        fileNumber =j;
        file = append(dir,fileName(1:2),string(fileNumber),'.csv');
        pred = predictWithSignleReading(file, model);
        preds = [preds pred];
        sum = sum+pred;
    end
   
    predictions = [predictions preds];
end
p = predictions;
end