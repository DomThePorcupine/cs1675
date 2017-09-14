function output = discretize_attribute(input_vect, bins)
    amax = max(input_vect);
    amin = min(input_vect);
    binsize = (amax - amin) / bins;
    disp(amin);
    disp(amax);
    output = [];

    for i = 1:length(input_vect)
        tv = find_bin(input_vect(i), binsize, amin, bins);
        output(i) = tv;
    end
end

function tbin = find_bin(value, sze, tmin, nBins)
    for x = 1:nBins
        %disp(x);
        %disp(value);
        if value <= tmin+(x*sze)
            tbin = x;
            return;
        end
    end
    
end