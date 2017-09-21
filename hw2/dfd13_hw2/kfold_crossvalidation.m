function [train test] = kfold_crossvalidation(data, k, m)
    % First we tak the mod, this will
    % tell us the number of groups that
    % will have to be 1 greater than
    % the calculated in group value
    plus_one = mod(length(data), k);
    in_group = floor(length(data)/k);
    sizes = zeros(k,1);
    for i=1:k
        if plus_one > 0
            sizes(i) = in_group + 1;
            plus_one = plus_one - 1;
        else
            sizes(i) = in_group;
        end
    end



    train = [];
    
    test = [];
    start_index = 1;

    for j=1:k
        if j == m
            test = [test, data(start_index: start_index + sizes(j) - 1)];
        else
            train = [train, data(start_index: start_index + sizes(j) - 1)];
        end
        start_index = start_index + sizes(j);
    end
    
end