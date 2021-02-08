library(tidyverse)

# making sentences_list
sentences_list <- readLines("sentences.txt") %>% 
  str_split("\n")

# define function to find wrong sentences
where_wrong_sentence <- function(word_list) {
  map(word_list, ~ str_detect(sentences_list, .x) %>% which())
}

# making wrong word list
# wrong_word <- list("We came out of a very fashion-conscious scene.")


