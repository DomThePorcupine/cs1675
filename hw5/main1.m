study_data = load('pima_train_norm.txt');

attrs = study_data(:,1:8);
class_attrs = study_data(:,9);

training_weights = Log_regression(attrs, class_attrs, 2000);

disp(training_weights)