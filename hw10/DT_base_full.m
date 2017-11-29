function [test_y]  = DT_base_full(tr_x, tr_y, test_x, params)

%%%%%%%%%% Learning SVML %%%%%%%%%%%%%%%

% cost for crossing the margin
cost=1;
%% calls support vector machine code Lagrangian SVM to learn the model
[w,b]=svml(tr_x,tr_y,cost);
%%% now we apply the model to test data and make a decision
test_y=(test_x*w+b > 0);

return;