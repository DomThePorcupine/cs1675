function [test_y]  = DT_base_simple(tr_x, tr_y, test_x, params)
  %%% classification: default tree
  %%% learn a classification tree, such that any parent node 
  %%%% has at least 10 examples (default) and nodes are split till the leafs
  %%% are not pure, gini criterion is used for splits
  tree = fitctree(tr_x,tr_y, 'splitcriterion', 'gdi', 'MaxNumSplits', 1, 'Prune','off');
  
  test_y = predict(tree,test_x);
  
  return;
end