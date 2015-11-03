# Dispersion Features

The dispersion features compare the dispersion, i.e. the (aggregated) distances, of all points in the initial design with the dispersion among the best points design. Per default, this set of "best points" is based on the 2%, 5% and 10% quantile of the objectives.
Those dispersions are then compared based on the ratio as well as on the difference.

For a complete overview of the features, please refer to the documentation of `calculateFeatureSet`.

## Literature Reference
Lunacek, M. and Whitley, D. (2014), "The Dispersion Metric and the CMA Evolution Strategy", in Proceedings of the 8th Annual Conference on Genetic and Evolutionary Computation, pp. 477--484, ACM ([http://dx.doi.org/10.1145/1143997.1144085](http://dx.doi.org/10.1145/1143997.1144085)).