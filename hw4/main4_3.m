% lets load both sets of data like we did previously
training = load('housing_train.txt');
testing = load('housing_test.txt');

% First step is to normalize everything
trainingNorm = zeros(size(training));
testingNorm = zeros(size(testing));

for i = 1:13
  [mntr, stdtr] = compute_norm_parameters(training(:,i));
  [mnte, stdte] = compute_norm_parameters(testing(:,i));
  normtr = normalize(training(:,i), mntr, stdtr);
  normte = normalize(testing(:,i), mnte, stdte);
  for j = 1:length(normtr)
    trainingNorm(j,i) = normtr(j);
  end
  for j = 1:length(normte)
    testingNorm(j,i) = normte(j);
  end
end

% Finally append the last column unchanged to both
for i = 1:length(training(:,14))
  trainingNorm(i,14) = training(i,14);
end

for i = 1:length(testing(:,14))
  testingNorm(i,14) = testing(i,14);
end

[trainingWeights, testingWeights] = online_descent(trainingNorm, testingNorm);

trPredict = LR_predict(trainingNorm(:,1:13), trainingWeights);
tePredict = LR_predict(testingNorm(:, 1:13), testingWeights);

mnsqrtr = (1/length(trainingNorm(:,14)) * sumsqr(trainingNorm(:,14) - trPredict));
mnsqrte = (1/length(testingNorm(:,14)) * sumsqr(testingNorm(:,14) - tePredict));

disp(mnsqrtr);
disp(mnsqrte);
