# Barrier Trees

After discretizing the search space using [generalized cell mapping (GCM)](gcm.md) and choosing a representative value for every cell, `calculateBarrierTrees` calculates barrier trees of the function's landscape. 

Since GCM is the basis, all barrier trees are also calculated for all three approaches `min`, `mean`, and `near` (see [GCM](gcm.md)).

The idea of barrier trees is to represent an optimization function's landscape using trees. Every mininum, both local and global, is represented by a leaf in the tree. Other nodes in the tree represent saddle points that connect the minima.

The features calculated here describe the structure of the resulting barrier tree. This encompasses, among others, the number of leaves, the number of levels, and basin structure.

# Literature Reference
Flamm et al. (2012), "Barrier Trees of Degenerate Landscapes", in Z. Phys. Chem. (216:2), pp. 155--173 ([http://dx.doi.org/10.1524/zpch.2002.216.2.155](http://dx.doi.org/10.1524/zpch.2002.216.2.155)).

For the underlying concept of GCM refer to Kerschke et al. (2014), "Cell Mapping Techniques for Exploratory Landscape Analysis", in EVOLVE-A Bridge between Probability, Set Oriented Numbers, and Evolutionary Computation V, pp. 151--131 ([http://dx.doi.org/10.1007/978-3-319-07494-8_9](http://dx.doi.org/10.1007/978-3-319-07494-8_9)).

