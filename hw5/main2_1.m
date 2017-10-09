study_data = load('pima.txt');

class_data = study_data(:,9);

mat_size = size(study_data);
czc = 1;
coc = 1;
class_zero = zeros(500,9);
class_one = zeros(268,9);

for i=1:mat_size(1)
  if study_data(i,9) == 0
    % add to class zero
    for j=1:mat_size(2)
      class_zero(czc,j) = study_data(i,j);
    end
    czc = czc + 1;
  else
    for j=1:mat_size(2)
      class_one(coc,j) = study_data(i,j);
    end
    coc = coc + 1;
  end
end

figure

for i=1:8
  subplot(2,8,i) 
  histogram_analysis(class_zero(:,i))
  % w = waitforbuttonpress;
end
for i=9:16
  subplot(2,8,i) 
  histogram_analysis(class_one(:,i-8))
  % w = waitforbuttonpress;
end


disp(class_zero);
disp(class_one);
    

