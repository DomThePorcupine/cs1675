training = load('housing_train.txt');
testing = load('housing_test.txt');

X = training(:, 1:13);
y = training(:, 14);

weights = LR_solve(X, y);

disp(weights);

Xt = testing(:, 1:13);
yt = testing(:, 14);

trPredict = LR_predict(X, weights);
tePredict = LR_predict(Xt, weights);

mnsqrtr = mean_sqr_error(y, trPredict);
mnsqrte = mean_sqr_error(yt, tePredict);

disp(mnsqrtr);
disp(mnsqrte);


