function rvect = normalize(input_vect)
    rvect = [];
    tmean = mean(input_vect);
    tstd = std(input_vect);
    for i = 1:length(input_vect)
        rvect(i) = (input_vect(i) - tmean) / tstd;
    end
end