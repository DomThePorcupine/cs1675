study_data = load('gaussian.txt')
n = 0;
for i = 1:50
   n = n + study_data(i,1);
end
 
N = n * 1/50;

mn1 = sum(study_data(:,1)) * (1/length(study_data))
mn2 = sum(study_data(:,2)) * (1/length(study_data)) 

q1 = 
q2 = 
 
q=0;
for i = 1:50
   q = q + (study_data(i,1) - N)*transpose((study_data(i,1) - N));    
end
 
Q = 1/50 * q;
 
 
 
mu = N;
sigma = Q;
%%pd = makedist('Normal',mu,sigma);
 
O = -10:.01:20
p1 = normpdf(O, m1, sigma);
p2 = normpdf(O, m2, )
subplot(1,2,1)
plot(O, p1);
subplot(1,2,2)
plot(O, p2)