id = fopen('pima.txt', 'r');
input_format = '%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n';

sizeA = [9 768];

A = fscanf(id, input_format, sizeA);
A = A';

negative = A(A(:,end)==0,:);
positive = A(A(:,end)==1,:);

% Extract all the relevant columns

npregnant = negative(:,1)';
nplasma = negative(:,2)';
npressure = negative(:,3)';
ntriceps = negative(:,4)';
ninsulin = negative(:,5)';
nbmi = negative(:,6)';
ndiabetes = negative(:,7)';
nage = negative(:,8)';
nclass_v = negative(:,9)';

print_info('Pregnant', npregnant);
print_info('Plasma', nplasma);
print_info('Pressure', npressure);
print_info('Triceps', ntriceps);
print_info('Insulin', ninsulin);
print_info('BMI', nbmi);
print_info('Diabetes', ndiabetes);
print_info('Age', nage);

ppregnant = positive(:,1)';
pplasma = positive(:,2)';
ppressure = positive(:,3)';
ptriceps = positive(:,4)';
pinsulin = positive(:,5)';
pbmi = positive(:,6)';
pdiabetes = positive(:,7)';
page = positive(:,8)';
pclass_v = positive(:,9)';

print_info('Pregnant', ppregnant);
print_info('Plasma', pplasma);
print_info('Pressure', ppressure);
print_info('Triceps', ptriceps);
print_info('Insulin', pinsulin);
print_info('BMI', pbmi);
print_info('Diabetes', pdiabetes);
print_info('Age', page);


function print_info(name, info_array)
    to_disp = sprintf('Stats for %s\nMean %f\nSD: %f\n--------------------------\n', name, mean(info_array), std(info_array));
    disp(to_disp)
end