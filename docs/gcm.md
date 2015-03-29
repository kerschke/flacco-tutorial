# Generalized Cell Mapping Features

Generalized cell mapping (GCM) discretizes a continuous search space in a fashion similar to [simple cell mapping (SCM)](cm.md). However, in contrast to SCM, GCM allows each cell to have multiple image cells. Therefore, the GCM model captures all transitioning probabilities between the cells and can be interpreted as an absorbing Markov chain.

For each cell, a representative objective function value is chosen. Consequently, the cell mapping abstracts from the original function evaluations and reduces the number of values to at most one per cell.

Three approaches are used for finding the representative value for each cell: `min`, `mean`, and `near`. In the `near` approach, the representative value is the one that is closest to a cell's center. In the `mean` approach, all values that are located in one cell are averaged to create the representative value of that cell. For the `min` approach, the minimum of one cell's values is used as the representative value. Note that, for the last two approaches,  no representative value for a cell can be found if no values belong to that cell.

# GCM Terms


- **Attractor** / **Periodic cell**
    refers to a cell that only leads to itself, thus absorbing transitions. This cell corresponds to local optima candidates.

- **Transient cell**
    refers to a cell that is not periodic. Therefore, the system will leave these cells with certainty. The terms below can be used to describe transient cells.

- **Uncertain cell**
	refers to a cell that leads to multiple attractors.


- **Basin**
    refers to a set of cells that lead to the same attractor.
 

# Literature Reference
Kerschke et al. (2014), "Cell Mapping Techniques for Exploratory Landscape Analysis", in EVOLVE-A Bridge between Probability, Set Oriented Numbers, and Evolutionary Computation V, pp. 151--131 ([http://dx.doi.org/10.1007/978-3-319-07494-8_9](http://dx.doi.org/10.1007/978-3-319-07494-8_9)).