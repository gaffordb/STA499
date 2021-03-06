install.packages("readxl")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("foreach")
install.packages("lme4")
install.packages("lmerTest")

library(stringr) # String manipulation
library(readxl) 
library(dplyr)
library(lme4)
library(lmerTest)
#reading in files

eventTimesMessage <- read.csv("H:\\CannabisStudy\\message\\eventTimesMessage.csv")
analysisMes <- read.csv("H:\\CannabisStudy\\message\\analysisMes.csv")

View(eventTimesMessage)
View(analysisMes)


summary(mesfit)
#fitting a model
#Model 1: SD lane dev as outcome and dosing level as predictor

mesfit <- lmer(data = analysisMes, SD.Lane.Deviation ~ (1 | ID) + Experiment + DosingLevel + Avg.Speed + factor(eventNum) +  factor(LogStreams.5) )
summary(mesfit)



#Model 3: using THC and BAC levels instead of Dosing Levels

mesfit <- lmer(data = analysisMes, SD.Lane.Deviation ~ (1 | ID) + Experiment + THC + BAC + Avg.Speed + factor(LogStreams.5))
summary(mesfit)
#experiment Avg. Speed and EventNum are significant predictors of SD lane dev


#Model 4: using Avg Speed as an outcome

mesfit <- lmer(data = analysisMes, Avg.Speed ~ (1 | ID) + Experiment + Experiment:BAC + THC + BAC +  factor(LogStreams.5))
summary(mesfit)           


#THC and eventNum are significant predictors of Avg Speed in this model

mesfit <- lmer(data = analysisMes, SD.Lane.Deviation ~ (1 | ID) + Experiment + Experiment:BAC + THC + BAC + Avg.Speed + factor(LogStreams.5)) 
summary(mesfit)

#Model 6: using sp.speed as an outcome
mesfit <- lmer(data = analysisMes,  Sd.Speed ~ (1 | ID) + Experiment + THC + BAC + factor(LogStreams.5))
summary(mesfit)             

head(analysisMes)
