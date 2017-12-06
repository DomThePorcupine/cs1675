function score = AUROC_score(x,y)
  %[weight, bias] = svml(x, y, 1);
  
  %scores = zeros(length(x),1);

  %for i=1:length(x)
  %  scores(i) = stuff(x(i,:), weight, bias);
  %end

  [X,Y,T,AUC] = perfcurve(y,x,1);

  score = AUC;

end