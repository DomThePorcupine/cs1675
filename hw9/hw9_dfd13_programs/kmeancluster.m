means = load('partameans.txt');
data = load('partadata.txt');

dsize = size(data, 1);
msize = size(means, 1);

for i=1:dsize
  for j=1:msize
    dista = edistance(data(i, 1), data(i, 2), means(j, 1), means(j, 2));
    disp(sprintf('The distance from (%u, %u) to (%u, %u) is %f', data(i, 1), data(i, 2), means(j, 1), means(j, 2), dista));
  end
end

mins = zeros(2);

group = intmax;

meanav = zeros(msize, 2);

groupcount = zeros(msize, 1);


for i=1:dsize
  mindist = realmax;
  for j=1:msize
    dista = edistance(data(i, 1), data(i, 2), means(j, 1), means(j, 2));
    if dista < mindist
      group = j;
      mindist = dista;
      mins(1, 1) = data(i, 1);
      mins(1, 2) = data(i, 2);
      mins(2, 1) = means(j, 1);
      mins(2, 2) = means(j, 2);
    end
  end
  disp(sprintf('Data point (%u, %u), belongs to mean point (%u, %u)', mins(1, 1), mins(1, 2), mins(2, 1), mins(2, 2)));
  groupcount(group) = groupcount(group) + 1;
  meanav(group, 1) = meanav(group, 1) + data(i, 1);
  meanav(group, 2) = meanav(group, 2) + data(i, 2);
end

for i=1:msize
  disp(sprintf('New average point for group %u is: (%f, %f)', i, meanav(i, 1)/groupcount(i), meanav(i, 2)/groupcount(i)));
end
