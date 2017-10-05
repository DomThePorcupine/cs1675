% lets load both sets of data like we did previously
% I think this should be pretty similiar to one of our 
% previous problems
X = training(:, 1:13);
y = training(:, 14);

Xtnd = zeros(length(X(:,1)), 183);

for i=1:length(training(:,1))
  foo = extendx(X(i,:));
  for j=1:length(foo)
    Xtnd(i,j) = foo(j);
  end
end

weights = LR_solve(Xtnd, y);

Xt = testing(:, 1:13);
yt = testing(:, 14);

Xtndt = zeros(length(Xt(:,1)), 183);

for i=1:length(testing(:,1))
  foo = extendx(Xt(i,:));
  for j=1:length(foo)
    Xtndt(i,j) = foo(j);
  end
end

trPredict = LR_predict(Xtnd, weights);
tePredict = LR_predict(Xtndt, weights);

mnsqrtr = mean_sqr_error(y, trPredict);
mnsqrte = mean_sqr_error(yt, tePredict);

disp(mnsqrtr);
disp(mnsqrte);