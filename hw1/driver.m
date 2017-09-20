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

[foo barb] = divideset2(A, .66);
