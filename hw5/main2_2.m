exp_inputs  = [1 5 7 8];
norm_inputs = [2 3 4 6];
disp(exp_inputs(3));
%%% example: application of expfit and normfit functions
%%% class_0 : all inputs (x) with label class 0
%%% class_1 : all inputs (x) with label class 1
%%%
[class_0, class_1] = main2_1();
%%% fit the exponential class-conditional for input attribute 1 and class 0
%%% p(x_1|y=0, \mu_0_1)
[exp_0_1_muhat, exp_0_1_muci] = expfit(class_0(:,1));
%%% fit the exponential class-conditional for input attribute 1 and class 1
%%% p(x_1|y=1, \mu_1_1)
[exp_1_1_muhat, exp_1_1_muci] = expfit(class_1(:,1));
%%%% fitting of the class-conditional of the second attribute
%%%% with normal distribution
%%% class-condtional for class 0
%% p(x_2|y=0,mu_0_2,sigma_0_2)
[norm_0_2_mu,norm_0_2_sigma,muci_0_2,sci_0_2] = normfit(class_0(:,2));
%%% etc.