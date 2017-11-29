cluster_data = load('clustering_data.txt');
%class_data = load('class_labels.txt');

mincluster = realmax;
minclustergroup = zeros(1,2);

num_correct = 0;
min_num_correct = 0;

scores = zeros(1,1000);

for iters=1:1000
  class_data = randi([0,1],1000,1);
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

  
  %disp(members);
  for i=1:dsize
    for j=1:psize
      group(id(i), j) = group(id(i), j) / members(id(i));
    end
  end

  for i=1:dsize
    if (id(i) - 1) == class_data(i)
      num_correct = num_correct + 1;
    end
  end
  

  if mincluster > sum(fbar)
    min_num_correct = num_correct/dsize;
    mincluster = sum(fbar);
    minclustergroup(1) = members(1);
    minclustergroup(2) = members(2);
  end

  scores(iters) = num_correct/dsize;
  num_correct = 0;
end

propcounter = 0;

for i=1:1000
  if scores(i) > .47
    propcounter = propcounter + 1;
  end
end

disp(propcounter/1000);

histogram(scores);
disp(min_num_correct);
disp(mincluster);
disp(minclustergroup);
