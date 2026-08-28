#install.packages("broom", type="binary")
library(ape)
library(ggplot2)
#library(phytools)
#library(gtools)
library(ggtree)
#library(cowplot)
library(ggimage)
#library(ips)
library(treeio)
#require(phyloch)

#if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")

#BiocManager::install("ggtree")
setwd("~/Google Drive/My Drive/1_MSc_ULB/BionfoMScTest/4_PlannedProject/1_Experiments/5_Phase5_Reduced_Sampling/2_Analysis/7_Astral_V1/")


trans_mat<- read.csv("translationtips.csv",stringsAsFactors=FALSE,header=TRUE)
# Loads Loads the translation tip file and prepare it
rownames(trans_mat)<-trans_mat[,1]

# Load tree file
my_tree <- read.astral("iqtree-BS10_sp_V1.tre")

# Reroot TREE
my_tree@phylo <- root(my_tree@phylo,"ERR5033395_1M_L001")

my_tree@phylo$tip.label <- trans_mat[my_tree@phylo$tip.label,2] 

# Ladderize the tree # OPTIONAL
my_tree@phylo <- ladderize(my_tree@phylo,FALSE)

# Creates a Q matrix for the pies
Q1 <- as.numeric(my_tree@data$q1) * 100
Q <- as.data.frame(Q1)
Q$Q2 <- as.numeric(my_tree@data$q2) * 100
Q$Q3 <- as.numeric(my_tree@data$q3) * 100
Q$node <- my_tree@data$node

# Draw the plot
filename <- "Combretaceae_MSc_V5.pdf"

pdf(filename,3,4 ) #100 5/7 depening on tips lenght,7.125/14.250 + xlim(-0,0.20) # with and hight (filename, 5, 7.125)

p <- ggtree(my_tree@phylo, ladderize = FALSE, branch.length = "none", size = 0.2) %<+% my_tree@data  # + 
p <- p + xlim_tree(40) # standar is 50 distance bewteen right and left
p <- p + geom_tiplab(size=1.4,offset=0.25,fontface = "italic") #, hjust= -0.05 
p <- p + geom_nodelab(aes(label=sprintf("%.2f",as.numeric(pp1))), hjust=1.8, vjust=-0.6, size=1.2) ## one opage size 0.9

p <- p + ggtitle("Combretaceae_MSc_V5.pdf")

#Draw the pies
pies <- nodepie(Q, cols=1:3, color=c(Q1='blue', Q2='orange', Q3='grey'))
inset(p, pies, width=0.3, height=0.3,hjust=-0.05,vjust=0.1) # Here the size of the pies can be adjusted with width and height # one opage size 0.6 two pages size 0.05
dev.off()
system2("open", filename)
