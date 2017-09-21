function [newdata] = subsample(data, k)
    % step one is to generate a list of random
    % integers between 1 and the length of
    % data, the list will be k elements long
    rand_val_indicies = randperm(length(data), k);
    newdata = zeros(k, 1);
    for i=1:k
        newdata(i) = data(rand_val_indicies(i));
    end
end