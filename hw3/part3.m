id = fopen('poisson.txt', 'r');
input_format = '%f\n';

study_data = fscanf(id, input_format);

ml = 1/length(study_data) * sum(study_data);

a = 1+ml;
b = 2/(25*2+1);
g2 = gampdf(study_data,a,b);
plot(g2)
%a=3, b=5
a1= 3+ml;
b1 = 5/(25*5+1);
g3 = gampdf(study_data,a1,b1);

%subplot(1,2,1)
%plot(g2)
%subplot(1,2,2)
%plot(g3)