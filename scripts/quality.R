df = read.csv("model_quality.csv")
library(ggplot2)
library(ggrepel)

df = df[!is.na(df$size),]

the.rest = c("PENTAX","KODAK","SBIG","APPLE","SAMSUNG","MINOLTA",
             "LEICA","HP","ERICSSON","SIGMA","GE","CASIO","RICOH","BENQ")

makeplot = as.character(df$make)

for (i in 1:283) {
  if (makeplot[i] %in% the.rest) {
    makeplot[i] = "MINOR"
  }
}

df$makeplot = factor(makeplot)

colors = c("#01319c","#a4a4a7","#ffc801","#3d95ed","#e85a01","#a5a715","#fd4dd0")

ggplot(df,aes(year,size,color=makeplot,size=count,shape=type,label=model)) + 
  geom_point(stroke=1) +
  #scale_shape_manual(values=c(11,15,16,18,8,17)) +
  scale_shape_manual(values=c(11,0,1,5,8,2)) +
  scale_size_continuous(range = c(1,22)) +
  scale_color_manual(values = colors) +
  theme(panel.background = element_rect(fill = "black"),
        panel.grid.major = element_line(color = "white",size=0.25),
        panel.grid.minor = element_line(color = "white",size=0.25,linetype="dashed"),
        plot.background = element_rect(fill = "black"),
        text = element_text(color="white"),
        axis.text = element_text(color="white",size=15),
        legend.position = "none") +
  labs(x="Year",y="Sensor Area (mm^2)")
  #geom_text_repel(data=subset(df,df$count > 100),color="white",size=4)
  

ggsave(filename="/Users/damoncrockett/Desktop/astrophotography_data/quality.png",
       width=8.5,height=8.5,units="in")


