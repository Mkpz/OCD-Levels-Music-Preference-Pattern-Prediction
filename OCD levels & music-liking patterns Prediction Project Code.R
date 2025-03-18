#Loading dataset mxmh_survey_results as survey.
survey<-read.csv("C://Users//shrey//Downloads//mxmh_survey_results.csv")
head(survey)


##Data Vizualization:
#creating piechart to see counts of music listeners of various Primary streaming services given.
S1 <- survey %>% 
  filter(Primary.streaming.service=="Spotify" | Primary.streaming.service=="YouTube Music")

slices <- c(458, 50,94, 51, 11, 71)
lbl<- c("Spotify", "Other streaming service","YouTube Music", "Apple Music", "Pandora", "I do not use a streaming service.")
pie(slices, labels = lbl, main="Pie Chart of Primary streaming services", col = wes_palette("FantasticFox1", 6, type = "continuous")) 



#Boxplot::
S2 <- survey %>% 
  filter(Primary.streaming.service == "Spotify")
#ggplot(S3, aes(x=Fav.genre, y=Age)) + geom_point()
boxplot(Age~Fav.genre, data = S2,  main="Fav.genre for various Ages", xlab="Fav.genre", ylab = "Age", outline = FALSE)
#The genres like Latin have most of its listeners in their 20s. Similarly, genres like EDM have most of its listeners in their 20s-30s. Lastly, there is genre like Gospel with most of its listeners in their 20s to 50s. So, I have decided to compare how much did music listeners of the three genres Latin, EDM and Gospel feel their mental health has changed depending on the hours they usually listen to the genre's music. 



#Double bar plot:
S3 <- survey %>% 
  filter(Music.effects!="" & (Fav.genre=="Gospel" | Fav.genre=="Latin"|Fav.genre=="EDM"))

ggplot(S3, aes(x = Fav.genre, y = Hours.per.day, fill = Music.effects)) +
  geom_col(position = position_dodge())+
  ggtitle("Music effects from the hours per day music listened in the three fav genres")



#Stacked bar plot:
S5 <- survey %>% 
  filter(Frequency..EDM. != "Never"  & OCD <5 & While.working!="")

ggplot(S5, aes(x=OCD, fill=Frequency..EDM., color=Frequency..EDM.)) +
  geom_bar(position="identity")+ ggtitle("Frequency of EDM music listeners having OCD < 5 on scale of 10")


#Permutation testing:
```{r pressure, echo=FALSE}
#Hypothesis:
#H0: The true mean of Average Anxiety level in the EDM listeners who feel improved and those who feel no improvement is the same.
#H1: The true mean of Average Anxiety level in the EDM listeners who feel improved is less than the Average Anxiety level in the EDM listeners who feel no improvement.


s7 <- subset(survey, !is.na(Frequency..EDM. != "Never") & !is.na(Music.effects) & !is.na(OCD))
s7$Change <- "Better"
s7$Change[s7$Music.effects!="Improve"] <- "None"

source("C:\\Users\\shrey\\Downloads\\Permutation.R")
Permutation(100, s7, "Change", "OCD","Better", "None")
#As p-value is 0 (<0.05), we reject null hypothesis. Thus, we can conclude that the true mean of Average OCD level in the EDM listeners who feel improved/better is greater than the Average Anxiety level in the EDM listeners who feel no improvement.






#Bonferroni correction:
#Since there are distinct Favorite genres of the participants, we have (n choose 2) = (16 * 15) / 2 = 120 different Favorite genres of the participants. 

#Under Bonferroni hypothesis 1 test: 
#Our hypothesis: Average Anxiety levels after listening to EDM are higher than Average Anxiety levels after listening to Gospel
#Null hypothesis: There is no difference in Average Anxiety levels after listening to EDM and Anxiety levels after listening to Gospel


EDM<- subset(survey,  Fav.genre == "Rock")
EDM
Gospel<- subset(survey, Fav.genre == "Metal")
Gospel

#Calculating z-score:
EDM_explore<- explore(na.omit(EDM$OCD))
View(EDM_explore)
Gospel_explore <- explore(na.omit(Gospel$OCD))
View(Gospel_explore)


sd_EDM_Gospel <- sqrt((EDM_explore[3])^2/EDM_explore[4] + (Gospel_explore[3])^2/Gospel_explore[4])
zeta <-(EDM_explore[1]-Gospel_explore[1])/sd_EDM_Gospel
zeta

#Calculate p-value:
p_value <- 1 - pnorm(zeta)
p_value

#In this case, after applying Bonferroni Correction we get the value of significance level = 0.05/120= 4.16 x 10-04.
#Here, we get the p-value of 7.002217e-06 which is lower than the value of our new significance level of 4.16 x 10-04.
#Based on this we reject our null hypothesis and so we can conclude that, Average OCD levels after listening to EDM are signifcantly different than Average OCD levels after listening to Gospel.



#Under Bonferroni hypothesis 2 test: 
#Our hypothesis: Average OCD levels after listening to Latin are higher than Average OCD levels after listening to EDM.
#Null hypothesis: There is no difference in Average Average OCD levels after listening to Latin and the Average OCD levels after listening to EDM.

Latin<- subset(survey,  Fav.genre == "Latin")
Latin
EDM<- subset(survey, Fav.genre == "EDM")
EDM

#Calculating z-score:
Latin_explore<- explore(na.omit(EDM$OCD))
View(Latin_explore)
EDM_explore <- explore(na.omit(Latin$OCD))
View(EDM_explore)


sd_Latin_EDM <- sqrt((Latin_explore[3])^2/Latin_explore[4] + (EDM_explore[3])^2/EDM_explore[4])
zeta <-(Latin_explore[1]-EDM_explore[1])/sd_Latin_EDM
zeta

#Calculate p-value:
p_value <- 1 - pnorm(zeta)
p_value

#In this case, after applying Bonferroni Correction we get the value of the significance level= 0.05/120 = 4.16 x 10-04
#Here, we get the p-value of 0.777648 which is higher than the value of our 4.16 x 10-04.
#Based on this we do not reject our null hypothesis and so we can conclude that there is no difference in Average Average OCD levels after listening to Latin and the Average OCD levels after listening to EDM.







#Creating Regression model:
sreg<-subset(survey, Music.effects!="" &!is.na(Age), select=c(2:33))
# split your dataset
set.seed(1) # for reproducible
# training dataset
split.per = 0.8
sample <- sample(c(TRUE, FALSE), nrow(sreg), replace=TRUE, prob=c(split.per,1-split.per))
#testing dataset
sreg.test <- sreg[!sample,]

source("C://Users//shrey//OneDrive//Desktop//Data 101//hw//Errorfunction.R")
# Regression Model 1: 
# Model uses OCD level as response, predictors as Age, Fav.genre, total hours.per.day.
# After this, rediction for the test data is made using this model.
# So, the prediction is compared with actual data and the RMSE is 2.879737.
model <- lm(OCD~Age+Fav.genre+Hours.per.day, sreg.test)
model.predict<- predict(model, sreg.test)
regr.error(model.predict, sreg.test$OCD)


# Regression Model 2: 
# Model is created using Anxiety level as response, predictors as Fav.genre, total hours.per.day, 
# Music.effects, whether the participant is exploratory in trying new music and wether the participant listens to Foreign language related music. 
# Then prediction for the test data is made using this model.
# Finally, the prediction is compared with actual data and the RMSE is 2.749560.
model2 <- lm(OCD~I(Age^2)+Age+Fav.genre+Music.effects+Hours.per.day+Exploratory+Foreign.languages+Primary.streaming.service, sreg.test)
model2.predict<- predict(model2, sreg.test)
regr.error(model2.predict, sreg.test$OCD)

