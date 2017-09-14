function [training testing] = divideset1(datasets, ptrain)
    training = {};
    testing = {};
    
    for n = 1:768
        if 1*rand(1,1) <= ptrain
            training = [training, datasets(n,:)];
        else
            testing = [testing, datasets(n,:)];
        end
    end
end