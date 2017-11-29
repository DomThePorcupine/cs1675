cluster_data = load('clustering_data.txt');
mincluster = realmax;
minclustergroup = zeros(1,2);

for iters=1:30
  [id, foo, fbar] = kmeans(cluster_data, 2);

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
