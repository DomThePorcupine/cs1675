id = fopen('pima.txt', 'r');
input_format = '%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n';

sizeA = [9 768];

A = fscanf(id, input_format, sizeA);
A = A';

% Extract all the relevant columns
pregnant = A(:,1)';
plasma = A(:,2)';
pressure = A(:,3)';
triceps = A(:,4)';
insulin = A(:,5)';
bmi = A(:,6)';
diabetes = A(:,7)';
age = A(:,8)';
class_v = A(:,9)';

print_info('Pregnancies', pregnant);
print_info('Plasma', plasma);
print_info('Pressure', pressure);
print_info('Triceps', triceps);
print_info('Insulin', insulin);
print_info('BMI', bmi);
print_info('Diabetes', diabetes);
print_info('Age', age);
% print_info('Class', pregnant);
%disp(pregnant)
%{
print_corr_info('Pregnancies', corrcoef(pregnant, class_v));
print_corr_info('Plasma', corrcoef(plasma, class_v));
print_corr_info('Blood Pressure', corrcoef(pressure, class_v));
print_corr_info('Triceps', corrcoef(triceps, class_v));
print_corr_info('Insulin', corrcoef(insulin, class_v));
print_corr_info('BMI', corrcoef(bmi, class_v));
print_corr_info('Diabetes', corrcoef(diabetes, class_v));
print_corr_info('Age', corrcoef(age, class_v));
%}
print_corr_info('Pregnancies vs Plasma', corrcoef(pregnant, plasma));
print_corr_info('Plasma', corrcoef(plasma, class_v));
print_corr_info('Blood Pressure', corrcoef(pressure, class_v));
print_corr_info('Triceps', corrcoef(triceps, class_v));
print_corr_info('Insulin', corrcoef(insulin, class_v));
print_corr_info('BMI', corrcoef(bmi, class_v));
print_corr_info('Diabetes', corrcoef(diabetes, class_v));
print_corr_info('Age', corrcoef(age, class_v));



%pressure(pressure == 0) = NaN
%cls = zeros(length(age, 1), 3)
%foo = linspace(1,10,length(age))
scatter(insulin, diabetes, 'filled')

fclose(id);


function x = print_info(name, info_array)
    to_disp = sprintf('Stats for %s\nMax: %f\nMin: %f\nMean %f\nVariance: %f\n--------------------------\n', name, max(info_array), min(info_array), mean(info_array), var(info_array));
    disp(to_disp)
end

function y = print_corr_info(name, info_array)
    to_disp = sprintf('%s has correlation value of: %f', name, info_array(1,2));
    disp(to_disp)
end