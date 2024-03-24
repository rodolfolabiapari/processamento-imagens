function d = hist_inter(vecA, vecB)
% HIST_INTER:   histogram intersection
% Input 
% vecA, vecB: histograms
% Output
% d : normalized histogram intersection 


min_sum = min(sum(vecA), sum(vecB));
d = sum( min(vecA, vecB) ) / min_sum;