id = fopen('mean-study-data.txt', 'r');
input_format = '%f\n';

study_data = fscanf(id, input_format);

mean_vals = zeros(1000,1);

for i=1:1000
    mean_vals(i) = mean(subsample(study_data, 20));
end

disp(mean(mean_vals));
histogram(mean_vals, 20);