library(tidyverse)

sentences_list <- readLines("sentences.txt") %>% 
  str_split("\n")

# People should be more discreet when criticism other people.

str_detect(sentences_list, "People should be more discreet when criticism other people") %>% 
  which()
