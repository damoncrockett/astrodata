df = read.csv("glyph_ball_quality_R.csv")
library(ggplot2)
str(df)

the.rest = c("PENTAX","KODAK","SBIG","APPLE","SAMSUNG","MINOLTA",
             "LEICA","HP","ERICSSON","SIGMA","GE","CASIO","RICOH","BENQ")

makeplot = as.character(df$make)

for (i in 1:3856) {
  if (makeplot[i] %in% the.rest) {
    makeplot[i] = "MINOR"
  }
}

df$makeplot = factor(makeplot)

ggplot(df,aes(x,y,color=makeplot,size=emp,shape=type)) + 
 geom_point() +
 scale_size_continuous(range=c(1,3.6)) +
 scale_shape_manual(values=c(11,15,16,18,8,17)) +
 scale_color_manual(values=c("#01319c","#a4a4a7","#ffc801","#3d95ed","#e85a01","#a5a715","#fd4dd0")) +
 theme(panel.background = element_rect(fill = "black"),
       panel.grid.major = element_line(color = "black"),
       panel.grid.minor = element_line(color = "black"),
       plot.background = element_rect(fill = "black"),
       text = element_blank(),
       axis.text = element_blank(),
       axis.ticks = element_blank(),
       legend.title = element_blank(),
       legend.key = element_rect(fill="black",color="black"),
       legend.background = element_rect(fill="black"),
       legend.position = "none") +
  facet_wrap(~type)

ggsave("glyph_ball_quality_facet-2.png",width=30,height=30,units="in",limitsize=0)


# legend

tmp = data.frame(
  x=c(1,0,1,1,1,1,1,1,2,2,2,2,2,2,2,3),
  y=c(5,1,1,1.5,2,2.5,3,3.5,1,1.4,1.8,2.2,2.6,3,3.4,1),
  z=c(0,0,1,2,3,4,5,6,1,1,1,1,1,1,1,3),
  w=c(0,0,1,1,1,1,1,1,0,2,3,4,5,6,7,0))

ggplot(tmp,aes(x,y,shape=as.character(z),color=as.character(w))) +
  geom_point(size=4) +
  scale_shape_manual(values=c(1,16,15,11,18,8,17)) +
  scale_color_manual(values=c("#01319c","white","#a4a4a7","#ffc801","#3d95ed","#e85a01","#a5a715","#fd4dd0")) +
  theme(panel.background = element_rect(fill = "black"),
        panel.grid.major = element_line(color = "black"),
        panel.grid.minor = element_line(color = "black"),
        plot.background = element_rect(fill = "black"),
        text = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.title = element_blank(),
        legend.key = element_rect(fill="black",color="black"),
        legend.background = element_rect(fill="black"),
        legend.position = "none")

ggsave("glyph_ball_quality_legend.png",width=2,height=2,units="in",limitsize=0)
