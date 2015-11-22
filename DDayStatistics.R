#connect to MongoDB(deprecated)
m=mongo(collection = "plaintiff_violence", db = "violence", url = "mongodb://localhost",verbose = TRUE)
plaintiff_violence <- m$find(query = "{}",fields = "{}",limit = 100)

#set working directory
setwd("~/dropbox/2015bigdata/caregiver/")
getwd()
#read csv file
jurydata <- read.csv("jurydata.csv")
#recode 99 to missing in column "caregiver" 
jurydata$caregiver[jurydata$caregiver==99] <- NA
jurydata$custody[jurydata$custody==99] <- NA
jurydata$r_affair[jurydata$r_affair==99] <- NA
jurydata$r_violence[jurydata$r_violence==99] <- NA
jurydata$r_other[jurydata$r_other==99] <- NA
jurydata$r_prisoner[jurydata$r_prisoner==99] <- NA
jurydata$r_disappear[jurydata$r_disappear==99] <- NA
jurydata$r_disorder[jurydata$r_disorder==99] <- NA
jurydata$off_lawyer[jurydata$off_lawyer==99] <- NA
jurydata$de_lawyer[jurydata$de_lawyer==99] <- NA
str(jurydata)
#multinominal logit regression (DV:"caregiving")
install.packages("mlogit")
library(mlogit)
jurytable <- mlogit.data(jurydata, varying = NULL, choice = "caregiver",shape = "wide")
model<-mlogit(formula=caregiver ~ 0 | r_affair
            +r_violence+r_other+ r_prisoner+r_disappear
            +r_disorder+off_lawyer + de_lawyer
            , data=jurytable, reflevel="0")
summary(model)
## change reference level of DV
model<-mlogit(formula=caregiver ~ 0 | r_affair 
              + r_violence 
              + r_other
              + r_prisoner
              + r_disappear
              + r_disorder
              + off_lawyer
              + de_lawyer, data=jurydata2, reflevel="1")
summary(model)
#decision tree--ctree(DV:caregiver)
install.packages("party")
library("party")
ju=jurydata[jurydata$caregiver==1,-6]
ju2=jurydata[jurydata$caregiver!=1,-6]
ju1=sample(nrow(ju), size=500)
ju=ju[ju1,]
ju3=merge(ju, ju2, all=TRUE)
ctree.model <- ctree(caregiver ~ . , data = ju3)
plot(ctree.model)

#binary logit regression (DV:"off_lawyer")
model <- glm(formula= off_lawyer~., data=jurydata, family=binomial)
summary(model)



