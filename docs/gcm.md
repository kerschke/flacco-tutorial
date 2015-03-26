# Generalized Cell Mapping Features

Similar to simple cell mapping (SCM), generalized cell mapping (GCM) discretizes a continuous search space. However, in contrast to SCM, GCM allows each cell to have multiple image cells. Therefore, the GCM model captures all transitioning probabilities between the cells and can be interpreted as an absorbing Markov chain.

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