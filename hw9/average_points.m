% Given an array of points return the average of
% all of them
function av = average_points(points)
  num_points = size(points, 1);
  num_dimensions = size(points, 2);
  
  tmp = zeros(num_dimensions, 1);
  for i=1:num_points
    for j=1:num_dimensions
      tmp(j) = tmp(j) + points(i,j);
    end
  end

  av = zeros(num_dimensions, 1);
  for i=1:num_dimensions
    av(i) = tmp(i)/num_points;
  end
end