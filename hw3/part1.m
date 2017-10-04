id = fopen('coint.txt', 'r');
input_format = '%f\n';

study_data = fscanf(id, input_format);

count = 0;

for i=1:length(study_data)
  if(study_data(i) == 0)
    count = count + 1;
  end
end

X = 0:.01:1;

prior = betapdf(X,4,2);
poster = betapdf(X, 69, 37);
[y, b] = max(poster);
disp(y);
disp(b);
figure;
plot(X,prior,'Color','r','LineWidth',2);
hold on; % hold the plot for other curves
plot(X,poster,'Color','b','LineWidth',2);

plot((b-1)/100,y,'O','MarkerSize',10);
hold off;