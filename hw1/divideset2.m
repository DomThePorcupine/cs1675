function [training testing] = divideset2(datasets, ptrain)
    training = {};
    testing = {};
    dsize = size(datasets, 1);
    trsize = dsize * ptrain; 
    trct = 1;
    used = zeros(dsize, 1);

    while trct < trsize
        rn = randi([1,dsize]);
        if used(rn) == 0
            used(rn) = 1;
            trct = trct + 1;
            training = [training, datasets(rn,:)];
        end

    end
    b = sprintf('hi');
    disp(b);
    for n = 1:dsize
        if used(n) == 0
            testing = [testing, datasets(n,:)];
        end
    end
    
   
end