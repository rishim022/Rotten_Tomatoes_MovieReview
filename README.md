# Rotten_Tomatoes_MovieReview
Analysis of a data set of rotten tomatoes . - rt-polaritydata.tar.gz: contains this readme and two data files that   were used in the experiments described in Pang/Lee ACL 2005.    Specifically:    * rt-polarity.pos contains 5331 positive snippets   * rt-polarity.neg contains 5331 negative snippets    Each line in these two files corresponds to a single snippet (usually   containing roughly one single sentence); all snippets are down-cased.     
Dataset Link:-
http://www.cs.cornell.edu/people/pabo/movie-review-data/rt-polaritydata.tar.gz.

The analysis is the creation of corpus separation of the stop words from the corpus and cleaning the corpus.Creating tokens from the corpus to find the  top 15 stop words of the top 200 stop words.
Creating a term document matrix and creating a commonality cloud of the cleaned term document matrix fo the most common words in the corpus. 
Creating a wordcloud of the psoitive and negative reviews in the the merged corpus.
Creating a dendogram of the corpus. 
Creating a lexical diversity using quanteda package in R to measure the breadth and variety of vocabulary in the whole merged corpus object.
Creating a sentiment table using ggplot. 
Implementing Naives Bayes algorithm using textmodel_NB Naive Bayes classifier for texts.
