% Dominic DiPasquale
% dfd13

% load up our data
tr_data = load('pima_train.txt');
test_data = load('pima_test.txt');

% Take off 1 for class var
features = size(tr_data, 2) - 1;

% Training x and y
x = tr_data(:,1:features);
y = tr_data(:,end);

% Testing x and y
x_test = test_data(:,1:features);
y_test = test_data(:,end);

% first param is hidden sizes
neuraln = patternnet(2)
view(neuraln)

% set the number of epochs
neuraln.trainParam.epochs = 2000;
neuraln.trainFcn='traincgf';

% Now for the fun part! training
[neuraln, tr] = train(neuraln,x',y');



res=neuraln(x');
class_error_train=sum(abs(y-round(res)'))/size(res,2)
mse_error_train = perform(neuraln,y',res)


res_test = neuraln(x_test');
class_error_test=sum(abs(y_test-round(res_test)'))/size(res_test,2)
mse_error_test = perform(neuraln,y_test',res_test)

