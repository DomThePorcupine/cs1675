id = fopen('resampling-data.txt', 'r');
input_format = '%f\n';

study_data = fscanf(id, input_format);

for i=1:10
    [trn, tst] = kfold_crossvalidation(study_data, 10, i);
    %disp(trn(2));
    disp(tst);
    out = sprintf('%d | mean: %d, std: %d', i, mean(tst), std(tst));
    %disp(out);
end