# Afraus
##An unsupervised multi-model fraud-detection algorithm
try it at ec2-52-3-148-193.compute-1.amazonaws.com:3838



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

Afraus leading principles of development are:

- *complementarity*: if two models of different families can catch two different fraud scheems, joining togheter can lead to a wider detection range
- *dynamism*: we can teach the algorithm to choose among different fraud detection models depending on data features, without requiring any user specification
