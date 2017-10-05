study_data = load('housing.txt');

attrs = ["CRIM", "ZN", "INDUS", "CHAS", "NOX", "RM", "AGE", "DIS", "RAD", "TAX", "PTRATIO", "B", "LSTAT", "MEDV"];

for i=1:13
  disp(attrs(i));
  scatter_plot(study_data(:,i), study_data(:,14));
  w = waitforbuttonpress;
end
%{
coefs = zeros(91,3);
count = 1;

for i = 1:14
  for j = (i+1):14
    cr = corrcoef(study_data(:,i), study_data(:,j));
    
    coefs(count, 1) = i;
    coefs(count, 2) = j;
    coefs(count, 3) = cr(2,1);
    count = count + 1;
  end
end

srtd = sortrows(coefs, 3);

for i = 1:91
  toprnt = sprintf('%s and %s have correlation: %f\n', attrs(srtd(i,1)), attrs(srtd(i,2)), srtd(i,3));
  disp(toprnt);
end
%disp(srtd);
%}