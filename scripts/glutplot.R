library(ggplot2)

#----------
# prelim
#----------

df = read.csv("astro_tag_exif_autotags_clean_quality_datetimes.csv")
df$shutter = NULL
df = df[!is.na(df$size),]

the.rest = c("PENTAX","KODAK","SBIG","APPLE","SAMSUNG","MINOLTA",
             "LEICA","HP","ERICSSON","SIGMA","GE","CASIO","RICOH","BENQ")
maker = as.character(df$make)
for (i in 1:3856) {
  if (maker[i] %in% the.rest) {
    maker[i] = "MINOR"
  }
}
df$maker = factor(maker)

df$ISO = as.numeric(as.character(df$ISO))
df$aperture = as.numeric(as.character(df$aperture))
df$modelyear = as.factor(df$modelyear)
df$year = as.factor(df$year)
df$hour = as.factor(df$hour)
df$isoweekday = as.factor(df$isoweekday)
df$month = as.factor(df$month)

#----------
# tradhist
#----------

DIR = "/Users/damoncrockett/Desktop/astrophotography_data/glutplot/"
numeric.vars = c("ISO","aperture","focal","count","size","emp","secpast")
cat.vars = c("modelyear","type","stype","year","month","isoweekday","hour","maker")

for (numeric.var in numeric.vars) {
  ggplot(df,aes_string(numeric.var)) + geom_histogram()
  ggsave(paste(DIR,numeric.var,".png",sep=""),width=8,height=4,units="in")
}

for (cat.var in cat.vars) {
  ggplot(df,aes_string(cat.var)) + geom_bar()
  ggsave(paste(DIR,cat.var,".png",sep=""),width=8,height=4,units="in")
}

# faceted by cats

for (numeric.var in numeric.vars) {
  for (cat.var in cat.vars) {
    ggplot(df,aes_string(numeric.var)) + geom_histogram() + facet_wrap(c(cat.var))
    ggsave(paste(DIR,numeric.var,"F",cat.var,".png",sep=""),width=11,height=11,units="in")
  }
}

#----------
# trad scat
#----------

for (pair in combn(c(numeric.vars,cat.vars),2,simplify=0)) {
  ggplot(df,aes_string(pair[1],pair[2])) + geom_point(alpha=0.5)
  ggsave(paste(DIR,pair[1],"_",pair[2],".png",sep=""),width=4,height=4,units="in")
}

# faceted by cats

for (pair in combn(c(numeric.vars,cat.vars),2,simplify=0)) {
  for (cat.var in cat.vars) {
    ggplot(df,aes_string(pair[1],pair[2])) + geom_point(alpha=0.5) + facet_wrap(c(cat.var))
    ggsave(paste(DIR,pair[1],"_",pair[2],"F",cat.var,".png",sep=""),width=11,height=11,units="in")
  }
}

