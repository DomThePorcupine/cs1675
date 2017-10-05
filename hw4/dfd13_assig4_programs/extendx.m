function output = extendx(X)
  output = [];
  % Add 1
  output = [output, 1];
  for i=1:length(X)
    % Add all the elements of x
    output = [output, X(i)];
    for j=1:length(X)
      % Add all the elements of x multiplied with each other
      % i think this is what is outlined on the hw sheet
      % with the summation forumlas
      output = [output, X(i) * X(j)];
    end
  end
end