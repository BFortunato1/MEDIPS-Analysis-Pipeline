library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

args <- commandArgs( trailingOnly = TRUE )
mqc_file=args[1]
out_file=args[2]
samples=unlist(strsplit(args[3],","))

theme_set(theme_classic())

fastq <- read_tsv(mqc_file)

ggplot(fastq, aes(x = Sample, y = total_deduplicated_percentage)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  ylab("Deduplicated % of reads")
ggsave(out_file,width = 15, height = 5)
