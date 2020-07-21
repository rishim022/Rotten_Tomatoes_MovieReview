library(data.table)

library(dplyr)
library(ggplot2)
library(knitr)
library(stringr)
library(DT)
library(plotly)
library(arules)
library(arulesViz)
library(visNetwork)
library(igraph)
library(readxl)

res <- read_xlsx("D:\\Chrome Downloads\\Data.xlsx", 3)
data_df<-res%>%select(Basket_ID,Card_ID,`Product B`,`Product C`)

View(data_df)

order_baskets=data_df %>%
  group_by(Basket_ID) %>%
  summarise(basket = as.vector(list(`Product B`)))

View(order_baskets)


transactions <- as(order_baskets$basket, "transactions")
inspect(transactions[1])



transactions <- as(order_baskets$basket, "transactions")
inspect(transactions[1])

rules <- apriori(transactions, parameter = list(support = 0.005, confidence = 0.25))

glimpse(rules)
rules <- rules[!is.redundant(rules)]
rules_dt <- data.table( lhs = labels( lhs(rules) ), 
                        rhs = labels( rhs(rules) ), 
                        quality(rules) )[ order(-lift), ]
head(rules_dt,5)

View(rules_dt)


library("RColorBrewer")
arules::itemFrequencyPlot(transactions,
                          topN=30,
                          col=brewer.pal(8,'Pastel2'),
                          main='Relative Item Frequency Plot',
                          type="relative",
                          ylab="Item Frequency (Relative)") 


plotly_arules(rules)


subrules2 <- head(sort(rules, by="confidence"),20)
ig <- plot( subrules2, method="graph", control=list(type="items") )
ig_df <- get.data.frame( ig, what = "both" )


subrules2 <- sample(rules, 10)
plot(subrules2, method="graph")
plot(rules, method = "two-key plot")

subrules <- rules[quality(rules)$confidence > 0.8]


























