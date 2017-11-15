cluster_data = load('clustering_data.txt');

[id, foo, fbar] = kmeans(cluster_data, 2);
disp(fbar);

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

disp(members);

for i=1:dsize
  for j=1:psize
    group(id(i), j) = group(id(i), j) / members(id(i));
  end
end

%disp(group);