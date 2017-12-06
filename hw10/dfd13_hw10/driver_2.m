% load up our data file
data = load('Data.txt');
numvars = size(data, 2);
numexamples = size(data, 1);

scores = zeros(numvars - 1, 2);

for i=1:numvars - 1
  scores(i,1) = Fisher_score(data(:,i), data(:,end));
  scores(i,2) = i;
end

[~,idx] = sort(scores(:,1), 'descend');
sortedmat = scores(idx,:);

disp(sortedmat);

disp(sprintf('-----------------------------------------'));

for i=1:numvars - 1
  scores(i,1) = AUROC_score(data(:,i), data(:,end));
  scores(i,2) = i;
end

[~,idx] = sort(scores(:,1), 'descend');
sortedmat = scores(idx,:);

disp(sortedmat);