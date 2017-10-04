study_data = load('gaussian.txt');
%input_format = '   %f   %f\n';

%study_data = fscanf(id, input_format);

% disp(study_data(:,2));

scatter(study_data(:,1),study_data(:,2));

-----------------------------------------------
matrix = load('gaussian.txt');
%input_format = '   %f   %f\n';

%study_data = fscanf(id, input_format);

% disp(study_data(:,2));


% scatter(study_data(:,1),study_data(:,2));

n = 0;
for i = 1:50
   n = n + matrix(i);
end

N = n * 1/50;



q=0;
for i = 1:50
   q = q + (matrix(i) - N)*transpose((matrix(i) - N));    
end

Q = 1/50 * q;



mu = N;
sigma = Q;
%%pd = makedist('Normal',mu,sigma);

%O = -5:.01:20
%y6 = normpdf(O,mu,sigma);
%plot(O, y6);




mu = N;
Sigma = cov(matrix);
x1 = 0:.2:15; x2 = 0:.2:15;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([0 6 0 6 0 .4])