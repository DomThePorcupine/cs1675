%% Logistic regression using batch gradient descend
% inputs: 1. the input data
%         2. the output data
%         3. number of steps
% returns: final weights
%%% annealed learning: 2/sqrt(k)

function W = Log_regression(X, Y, K, test_at, test_class)

%trguesses = zeros((K/10), 1);
%teguesses = zeros((K/10), 1);

col_ones = ones(size(X, 1), 1);
X = horzcat(col_ones, X);           % add a column of ones on the left to X
W = rand(size(X, 2), 1);            % initialize W to 1 to start with 
disp(W);
confusion = zeros(2);

%grph = init_progress_graph();

for k = 1:1:K                       %%% number of steps
    sum_err = 0;                    %%% initialize batch error function gradient
    for row = 1:1:size(X, 1)
        x = X(row,:)';
        y = Y(row,:);
        f = 1/(1 + exp(-(W'*x)));
        err = (y - f) * x;          % error (on-line gradient)
        sum_err = sum_err + err;    % update batch error function gradient
    end
    alpha = (2/sqrt(k));
    W = W + (alpha * sum_err);
    % lets check the mean misclass
    updgrp = mod(k,10);
    if updgrp == 0
        %guess = predict(X,W);

        %trguesses = mean_misclass_error(guess, Y);
        %guess = predict(test_at,W);
        %teguesses = mean_misclass_error(guess, test_class);
        % I call this because it is required, but it does not show anything
        % like last time
        %grph = add_to_progress_graph(grph, k/10, trguesses(k/10), teguesses(k/10));
    end
end
guess = predict(X,W);

trguesses = mean_misclass_error(guess, Y);
disp(trguesses);

guess = predict(test_at,W);
for i=1:length(guess)
    confusion(guess(i) + 1, Y(i) + 1) = confusion(guess(i) + 1, Y(i) + 1) + 1;
end
teguesses = mean_misclass_error(guess, test_class);
disp(teguesses)
%{
plot(linspace(1,2000,200), trguesses)
hold on
plot(linspace(1,2000,200), teguesses)
hold off
%}
%disp(confusion(1,2))
%disp(confusion(2,2)/(confusion(2,2) + confusion(1,2)))





