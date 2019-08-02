library(tidyverse)

sentences_list <- readLines("sentences.txt") %>% 
  str_split("\n")
