function [res] = predictWithSignleReading(dir, model)
%%This function is used for predict seizure activity with one single
%%reading of total 23 seconds (4097 data) 
signleReading=oneTo178Columns(dir);
sr_normalized = normalize(signleReading);
signleReading =array2table(sr_normalized);  

% Generating column names
cols = ["X1","X2"];
for i = 3:178
    c = append("X",string(i));
    cols(i) = c;
end
signleReading.Properties.VariableNames = cols;   
prediction=predict(model,signleReading);

thresholdCOnfidence = 68;

pred = sum(prediction)*100/23;

res = pred > thresholdCOnfidence;
end