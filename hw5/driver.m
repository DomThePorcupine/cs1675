train_study_data = load('pima_train.txt');
test_study_data  = load('pima_test.txt');

train_attrs = train_study_data(:,1:8);
test_attrs  = test_study_data(:,1:8);

[train_mean, train_std] = compute_norm_parameters(train_attrs);
[test_mean, test_std]   = compute_norm_parameters(test_attrs);

norm_train_attrs = normalize(train_attrs, train_mean, train_std);
norm_test_attrs  = normalize(test_attrs, test_mean, test_std);

train_file_id = fopen('pima_train_norm.txt','w');
test_file_id  = fopen('pima_test_norm.txt', 'w');

for i=1:length(norm_train_attrs)
  fprintf(train_file_id, '%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n', norm_train_attrs(i,:));
end

for i=1:length(norm_test_attrs)
  fprintf(test_file_id, '%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n', norm_test_attrs(i,:));
end


fclose(train_file_id);
fclose(test_file_id);