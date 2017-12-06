function score = Fisher_score(x,y)
  % first seperate by class
  totalex = size(x, 1);

  classone = {};
  classzero = {};

  for j=1:totalex
    if y(j) == 0
      classzero = [classzero x(j)];
    else
      classone = [classone x(j)];
    end
  end

  classone = cell2mat(classone)';
  classzero = cell2mat(classzero)';
  
  stdzero = std(classzero);
  stdone = std(classone);

  mnzero = mean(classzero);
  mnone = mean(classone);
  
  score = (mnone - mnzero).^2 / (stdzero.^2 + stdone.^2);
end