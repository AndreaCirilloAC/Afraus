# Afraus
##An unsupervised multi-model fraud-detection algorithm

Afraus is builted on three unsupervised models:

- *Benford Law's test*, which test the population of data against the benford
- *Control Chart*, which look for record outside the band define by the upper control limit and the lower control limit;
- *Local Outlier Factor*, an unsupervised algorithm pertaining to the k-NN family.

## Design

Afraus sequentially applies the three cited models consequently assigning a fraud-risk score.
Eventually, a total score is calculated for each record, and the score is assigned to the *Afraus-score* variable.

## Objectives
The main objective in developing Afraus is to build a tool that can be easily used from 
'non-techinal' people to detect frauds that may be occuring within their data.

This objective is pursued choosing only unsupervised models, that require no previous knowledge of possible
fraud schemes affecting the tested population, and no further specification by the user.

## Further Developments

I am Currently working on a web application that will let users test their custom population with Afraus, just pressing a 'show me the fraud' button.

More generally, Afraus could be used on each analysis were search for frauds/anomalies is implied.
