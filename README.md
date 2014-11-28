K-Means In J
------------

This is an implementation of K-Means, a simple clustering algorithm in
the remarkable and remarkably weird language J.

Usage
-----

    load '<path-to-lib>/km.ijs'
    vectors =: ? 100 2 $ 50
    nClusters =: 3

    nClusters km vectors

       0 0 0 0 1 1 2 0 0 1 2 0 2 2 ...


This results in a list of integral labels, associating each vector in
the right hand argument with a cluster.  To recover the cluster
centers you may use

    ids calcCenters vectors

Which returns a list of vectors representing the center of each
cluster.

About K-Means
-------------

K-means works by the almost comically simple expedient of assigning
each vector in the data set to a random cluster, calculating the
centers of these clusters, and then re-assigning the vectors to the
center to which they are nearest.

The process is repeated as necessary until the assignments converge.
Generally, this results a few stable configurations which depend on
the initial assignment.  
