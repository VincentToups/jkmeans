NB. This file contains an implementation of k-means, a clustering
NB. algorithm which takes a set of vectors and a number of clusters
NB. and assigns each vector to a cluster.
NB.
NB. Example Data
NB. v1 =: ?  10 2 $ 10 
NB. v2 =: ?  3 2 $ 10
NB. v3 =: ? 100 2 $ 50
NB. trivialV =: 2 2 $ 10
NB.
NB. Examples
NB. 3 km v3

NB. produce a permutation of y.
permutation =: (#@[ ? #@[)

NB. shuffle list
NB. shuffle the list
shuffle =: {~ permutation

NB. nClusters drawIds vectors
NB. given a list of vectors and a number of clusters
NB. assign each vector to a cluster randomly
NB. with the constraint that all clusters are
NB. roughly equal in size.
drawIds =: shuffle@(#@] $ i.@[)

NB. distance between two vectors as lists
vd =: +/@:(*:@-)

NB. Give the distance between all vectors in x and y
distances =: (vd"1 1)/

NB. return the list of indices of the minimum values of the rows.
minI =: i. <./

NB. Given x a list of centers and y a list of vectors,
NB. return the labeling of the vectors to each center.
reId =: ((minI"1)@distances)~

NB. canonicalize labels 
NB. given a list of labels, re-label the labels so
NB. that 0 appears first, 1 second, etc
canonicalize =: ] { /:@~.

NB. (minI"1 v1 distances v2 ) 

vsum =: +/"1@|:
vm =: (# %~ (+/"1@|:))

calcCenters =: (/:@~.@[) { (vm/.)

NB. ids kmOnce vectors This performs the heavy lifting for K-means.
NB. Given a list of integral ids, one for each vector in the N x D
NB. vectors, this verb calculates the averages of the groups implied
NB. by those labels and re-assigns each vector to one of those
NB. averages, whichever it is closest to.

kmOnce =: dyad define
  ids =. x 
  vectors =. y
  centers =. ids calcCenters vectors
  centers reId vectors
)

NB. Use the power adverb to iterate kmOnce until the labels converge
kmConverge =: ((kmOnce~)^:_)~

NB. nClusters km dataset k means.  Given a cluster count on the left
NB. and a vector data set on the right, return an array of IDs
NB. assigning each vector to a cluster.
NB. One can use `calcCenters` to recover the cluster centers.
 
km =: canonicalize@((drawIds) kmConverge ])

NB. Example Data
NB. v1 =: ?  10 2 $ 10 
NB. v2 =: ?  3 2 $ 10
NB. v3 =: ? 100 2 $ 50
NB. trivialV =: 2 2 $ 10

NB. Examples
NB. 3 km v3

