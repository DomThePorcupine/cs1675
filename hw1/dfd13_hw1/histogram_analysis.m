function histogram_analysis(attribute_data)
%histogram_analysis -   Display a histogram 
%                       of some data
%
% Syntax: output = histogram_analysis(attribute_data)
%
% Long description
% This function takes a vector and shows a
% histogram of the data contained within
% the vector
    hist(attribute_data, 20)
end