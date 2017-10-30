% Dominic DiPasquale

% Read in the data
study_data = load('pima_train.txt');

testing_data = load('pima_test.txt');



attrs = study_data(:,1:8);
class_var = study_data(:,end);

[weight, bias] = svml(attrs, class_var, 1);

scores = zeros(length(attrs),1);
disp(scores);

for i=1:length(attrs)
  scores(i) = stuff(attrs(i,:), weight, bias);
end


conf_mat_train = zeros(2);

for i=1:length(attrs)
  guess = apply_svlm(attrs(i,:), weight, bias);
  if guess == 1
    if class_var(i) == 1
      conf_mat_train(1,1) = conf_mat_train(1,1) + 1;
    else
      conf_mat_train(1,2) = conf_mat_train(1,2) + 1;
    end
  else
    if class_var(i) == 1
      conf_mat_train(2,1) = conf_mat_train(2,1) + 1;
    else
      conf_mat_train(2,2) = conf_mat_train(2,2) + 1;
    end
  end
end


[X,Y,T,AUC] = perfcurve(class_var,scores,1);

plot(X,Y);
