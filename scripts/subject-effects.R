setwd("~/Dropbox/_unshared/work/projects-papers/Astrophotography/")

library(ggplot2)

df = read.csv("astro_tag_exif_autotags_clean_quality_datetimes_photo-url_views_faves_modeli.csv")

head(df)

t = rev(sort(table(df$user_nid)))
d = as.data.frame(t)
d$user = rownames(d)
rownames(d) = c(1:nrow(d))
head(d)
colnames(df)

temp = head(d,30)

tmp = df[df$user_nid %in% temp$user,c('user_nid','year')]

library(dplyr)

# my first 'tidyverse' code here... 
tmp = tmp%>%group_by(year,user_nid)%>%tally()

ggplot(tmp,aes(as.factor(year),n,group=user_nid,color=user_nid)) + 
  geom_line() +
  theme(legend.position = "none")