# # Declining Birth rates in the US: An Analysis of Potential Factors

This repo contains the code and data to produce 1) a paper which is a reproduction of [Lucas Kutscheraand and Gilad Feldman's paper, "The impact of past behaviour normality on regret: replication andextension of three experiments of the exceptionality effect"](https://www.tandfonline.com/doi/full/10.1080/02699931.2018.1504747?scroll=top&needAccess=true) and 2) replications of the figures 1, 2, 3a, 3b of this paper. 

It is organised as follows:

inputs
- data - contains all the data files to be used for analysis and in the tables and figures.
  - figure1 - data for figure 1 
  - figure2 - data for figure 2
  - figure3a - data for figures 3a
  - figs3b - data for figures 3b
  - Ex1.csv. - table for part1
  - osf-past-normality-regret-replication-exp1-data.csv - orginal table for experiment1
  -table2.csv - part2
- literature
  - Kutscher & Feldman 2019 CogEmo past behavior & regret-exceptionality replication & extension-w-supplement.pdf - the original paper of which we make a reproduction.

outputs
- paper
  - paper.pdf - the reproduction paper
  - paper.Rmd - R markdown file to produce paper.pdf
  - references.bib - reference list for paper.pdf

replication
- plots - stores the replicated figures.
  - figure1.png
  - figure2a.png
  - figure2b.png
  - figure2d.png
  - figure2e.png
  - figure5.png
- scripts - stores the code to replicate each of the figures.
  - fig1_replication.R
  - fig2a_replication.R
  - fig2b_replication.R
  - fig2d_replication.R
  - fig2e_replication.R
  - fig5_replication.R


## Reproducibility

Download all files and open the R project Paper_2 in R Studio.

To reproduce the paper, knit to pdf paper.Rmd found at outputs/paper/paper.Rmd.


The replication on the Social Science Reproduction Platform can be found at 