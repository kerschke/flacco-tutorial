# Barrier Trees

After discretizing the search space using [generalized cell mapping (GCM)](gcm.md) and choosing a representative value for every cell, `calculateBarrierTrees` calculates barrier trees of the function's landscape. 

Since GCM is the basis, all barrier trees are also calculated for all three approaches `min`, `mean`, and `near` (see [GCM](gcm.md)).

The idea of barrier trees is to represent the landscape of an optimization function using trees. Every mininum, both local and global, is represented by a leaf in the tree. Other nodes in the tree represent saddle points that connect the minima.

The features calculated here describe the structure of the resulting barrier tree. This encompasses, among others, the number of leaves, the number of levels, and basin structure.

# Literature Reference
Flamm, C. et al. (2012), "Barrier Trees of Degenerate Landscapes", in Z. Phys. Chem. (216:2), pp. 155--173 ([http://dx.doi.org/10.1524/zpch.2002.216.2.155](http://dx.doi.org/10.1524/zpch.2002.216.2.155)).

