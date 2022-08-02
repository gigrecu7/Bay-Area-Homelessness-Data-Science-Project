

library(arules)
install.packages("arulesViz")
library(arulesViz)
library(dplyr)
library(readr)

homelessdata <- read_csv("Downloads/homelessdata.csv")


data2 <- select(homelessdata, 'Clients Ethnicity',
                'Clients Race', 'Clients Veteran Status',
                'Inbound Recidivism Appeared Before (Yes / No)',
                'Inbound Recidivism Appeared Before In Same Program (Yes / No)',
                'Inbound Recidivism Appeared Before with Stable Housing (Yes / No)',
                'Outbound Recidivism Appears Again (Yes / No)',
                'Outbound Recidivism Appears Again Without Stable Housing (Yes / No)',
                'Clients Gender', 'Clients Discharge Status',
                'Entry Screen Chronic Homeless at Project Start (Yes / No)',
                'Entry Screen Domestic Violence',
                'Entry Screen Currently Fleeing Domestic Violence',
                'Entry Screen Child Support (Yes / No)',
                'Entry Screen Earned Income (Yes / No)',
                'Entry Screen Income from any Source',
                'Entry Screen Pension or retirement income from a former job (Yes / No)',
                'Entry Screen Private Disability Insurance (Yes / No)',
                'Entry Screen Social Security Retirement Income (Yes / No)','Enrollments Individual or Family')


data3 <- na.omit(data2) 


frequentItems <- eclat(data3, parameter = list(supp = 0.6, maxlen=5))
frequentItems
inspect(frequentItems)
inspect(head(frequentItems))

frequentItems_sorted <- sort(frequentItems, by = 'support')
frequentItems_sorted
inspect(frequentItems_sorted)
inspect(head(frequentItems_sorted))


#generate rules
rules <- apriori(data3, parameter = list(supp=.7, conf=.8))
rules
rules_sorted_conf <- sort(rules, by = 'confidence')
inspect(rules_sorted_conf)
inspect(head(rules_sorted_conf))


rules_sorted_conf <- sort(rules, by = 'lift')
inspect(rules_sorted_conf)
inspect(head(rules_sorted_conf))

rules_sorted_conf <- sort(rules, by = 'support')
inspect(rules_sorted_conf)
inspect(head(rules_sorted_conf))


rules <- apriori(data3, parameter = list(supp=.7, conf=.8, minlen=4))
rules
inspect(head(rules))


#visualize
plot(rules)
plot(rules, interactive = T)

plot(rules, method = 'matrix')
plot(rules, method = 'graph')


#use specific items in generating rules
rules <- apriori(data3, parameter = list (supp = 0.4, conf=0.7),
                 appearance = list(default = 'lhs', rhs = 'Entry Screen Domestic Violence=Yes'))
rules
inspect(rules)
inspect(head(rules))
