cluster_data = load('clustering_data.txt');
mincluster = realmax;
minclustergroup = zeros(1,2);

% generate 10 random numbers between 1 and 140
% these will be our samples for the seeds
r = randi([1,140],10,1);

samples_1 = zeros(5, 55);
for i=1:5
  samples_1(i,:) = cluster_data(r(i), :);
  samples_2(i,:) = cluster_data(r(i+5),:);
end


seeds = zeros(2, 55);
seeds(1,:) = average_points(samples_1);
seeds(2,:) = average_points(samples_2);



for iters=1:30
  % generate 10 random numbers between 1 and 140
  % these will be our samples for the seeds
  r = randi([1,140],10,1);

  samples_1 = zeros(5, 55);
  for i=1:5
    samples_1(i,:) = cluster_data(r(i), :);
    samples_2(i,:) = cluster_data(r(i+5),:);
  end


  seeds = zeros(2, 55);
  seeds(1,:) = average_points(samples_1);
  seeds(2,:) = average_points(samples_2);
  %[id, foo, fbar] = kmeans(cluster_data, 2);
  [id, foo, fbar] = kmeans(cluster_data, 2, 'dist', 'sqEuclidean', 'start', seeds);

  dsize = size(id, 1);

  psize = size(cluster_data, 2);

  group = zeros(2, psize);

  members = zeros(1,2);

  for i=1:dsize
    members(id(i)) = members(id(i)) + 1;
    for j=1:psize
      group(id(i), j) = group(id(i), j) + cluster_data(id(i), j);
    end
  end

  if mincluster > sum(fbar)
    mincluster = sum(fbar);
    %disp(members);
    minclustergroup(1) = members(1);
    minclustergroup(2) = members(2);
  end
  disp(members);
  for i=1:dsize
    for j=1:psize
      group(id(i), j) = group(id(i), j) / members(id(i));
    end
  end
end

disp(mincluster);
disp(minclustergroup);
