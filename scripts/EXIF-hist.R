df = read.csv("astro_tag_exif_autotags_clean_quality.csv")
#df = read.csv("model_quality.csv")
df = df[!is.na(df$size),]
library(ggplot2)

the.rest = c("PENTAX","KODAK","SBIG","APPLE","SAMSUNG","MINOLTA",
             "LEICA","HP","ERICSSON","SIGMA","GE","CASIO","RICOH","BENQ")

makeplot = as.character(df$make)

for (i in 1:3856) {
  if (makeplot[i] %in% the.rest) {
    makeplot[i] = "MINOR"
  }
}

df$makeplot = factor(makeplot)
colors = c("#01319c","#a4a4a7","#ffc801","#3d95ed","#e85a01","#a5a715","#fd4dd0")


#----------
# hist
#----------



df$date_taken = as.Date(df$date_taken)
df$xbin = c(rep(1:62,each=62),rep(63,times=12))
#df$xbin = cut(df$date_taken,242,labels=FALSE) 
#df.sorted = df[order(df$year,df$makeplot,df$type),]
df.sorted = df[order(df$xbin,df$makeplot,df$type),]

#bin.table = table(df.sorted$year)
bin.table = table(df.sorted$xbin)

ypos = c()
for (i in 1:length(bin.table)) {
  col.height = bin.table[i]
  ypos = append(ypos,c(1:col.height))
}

df.sorted$ypos = ypos

ggplot(df.sorted,aes(xbin,ypos,
                     color=makeplot,
                     size=size,
                     shape=type)) + 
#ggplot(df.sorted,aes(year,ypos,color=makeplot,size=count,shape=type)) + 
  geom_point() +
  #geom_point(stroke=1,size=1) +
  scale_shape_manual(values=c(11,15,16,18,8,17)) +
  #scale_shape_manual(values=c(11,0,1,5,8,2)) +
  scale_size_continuous(range = c(.1,9)) +
  scale_color_manual(values = colors) +
  theme(panel.background = element_rect(fill = "black"),
        #panel.grid.major = element_line(color = "white",size=0.25),
        #panel.grid.minor = element_line(color = "white",size=0.25,linetype="dashed"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "black"),
        text = element_blank(),
        axis.text = element_blank(),
        legend.position = "none")

ggsave(filename="/Users/damoncrockett/Desktop/astrophotography_data/hist-date-flat.png",
       width=16,height=16,units="in",limitsize=0)


