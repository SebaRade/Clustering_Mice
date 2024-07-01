# Unsupervised clustering of mice by behaviour

2023-07-17

**Background**<br>
My colleagues recently developed a mouse knockout model to decipher neuronal circuits involved in autism spectrum disorder development. In a battery of behavioural testings, potential differences between the wildtype and knockout animals were masked by large variances. Here’s a report on how I applied an unsupervised machine learning approach on the prepulse inhibition dataset.

<blockquote>
<b>Prepulse inhibition</b><br>
PPI is the neurological ability to react less strongly on a stimulus (pulse) when a weaker stimulus (prepulse) preceeds. PPI usually increases with sound level, but is often attenuated in neurological disorders. Here, the startle response of mice was measured after a 120 db burst of noise. PPI was evaluated by measuring the startle response when a prepulse of 69, 73 or 81 db preceeded the 120 db pulse. As internal control, the startle response was monitored at background noise (back) as well as in pulse-only trials at the beginning (pre) and end (post) of the test. PPI is calculated as
<br>
PPI=100*(MaxGP-MaxGPP)/MaxGP where MaxG is the maximum startle response.
<br>
All animal experiments were approved by the state of Berlin and followed the guidelines and recommendations of the European animal welfare law. No animals were harmed by or during the behaviour testings.
</blockquote>

**Results**<br>
The PPI methodology assumes that (i) the MaxG values are approx. normally distributed, (ii) there is no correlation with the background startle response and (iii) PPI increases with sound level. None of these prerequesites was fulfilled when analysing the raw data. Log-norm transformation of the MaxG values solved the distribution issue, but large variances due to the existence of subgroups did not allow to draw meaningful conclusions.
To characterise the subgroups, I decided to go for a k-means clustering approach using the stats and factoextra packages. The heuristic elbow and silhouette methods from the factoextra package as well as the NbClust() function from the NbClust package predicted k=3 as the optimal number of clusters. Next, I clustered the data using the kmeans() function and calculated the cluster means with aggregate(). This information was assigned to the original dataframe with cbind(). Finally, I plotted the clusters with the fviz_cluster() function and generated a parallel coordinate plot with the ggparcoord() function from the GGally package.

<br>
<img src="clustering.png" height="400">
<br>

The animals were nicely separated in three clusters (compared to k=2 and k=4) and the parallel coordinate plot revealed that the animals in each cluster are characterised by

- low background startle response with a high increase in PPI with sound level
- high background startle response with little increase in PPI with sound level
- high background startle response without an increase in PPI with sound level

Both genders and genotypes were equally distributed between the clusters, but cluster 1 contained largely animals from the first cohort, whereas cluster 2 contained largely animals from the second cohort. Furthermore, the genotypes within the clusters did not reveal differences in the PPI.

**Summary**<br>
Unsupervised clustering identified three animal subpopulations, which could not be compared as the prerequesites that the PPI methodology makes were not fulfilled. With this more distict differentiation, we can clearly say that the knockout did not affect the PPI.
