function [trweights, teweights] = online_descent(training, testing)
  n = length(training);
  ne = length(testing);

  trweights = zeros(13,1);
  teweights = zeros(13,1);
  
  foo = init_progress_graph();

  for update=1:3000

    bar = mod(update,50);
    if bar == 0
      
      trpr = LR_predict(training(:,1:13), trweights);
      trmn = mean_sqr_error(training(:,14), trpr);
      tepr = LR_predict(testing(:,1:13), teweights);
      temn = mean_sqr_error(testing(:,14), tepr);
      %add_to_progress_graph(foo, update, trmn, temn);

    end

    % lets go ahead and get a sample from the training set
    v = mod(update, n);
    if v == 0
      v = v + 1;
    end

    row = training(v,:);
    sums = 0;
    for j=1:13
      sums = sums + (trweights(j) * row(j));
    end
    learn = (.00001) * (row(14) - sums);

    % finally update our weights for the training set
    for i=1:13
      trweights(i) = trweights(i) + (learn * row(i));
    end

  % Now lets do the same things for the testing set
  % lets go ahead and get a sample from the training set
    v = mod(update, ne);
    if v == 0
      v = v + 1;
    end

    row = testing(v,:);
    sums = 0;
    for j=1:13
      sums = sums + (teweights(j) * row(j));
    end
    learn = (.00001) * (row(14) - sums);

    % finally update our weights for the training set
    for i=1:13
      teweights(i) = teweights(i) + (learn * row(i));
    end
  end
  
end