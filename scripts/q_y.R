df = read.csv("fuck.csv")
library(ggplot2)

ggplot(df[df$qual!=0,],aes(lon,lat,color=qual)) +
  borders(database = "world",
          colour="grey45",
          fill="grey25") +
  theme(panel.background = element_rect(fill="grey65"),
        panel.grid.major = element_line(color="grey65"),
        panel.grid.minor = element_line(color="grey65"),
        plot.background = element_rect(fill="grey65"),
        legend.position="none",
        axis.text = element_text(size=rel(0.1),color="white"),
        text = element_text(face="plain",color="white",size=15)) +
  geom_point(alpha=0.25,size=5) + 
  scale_color_gradient2(midpoint = 2.5, low = "yellow", mid = "white", high = "dodgerblue")

summary(lm(data=df, qual ~ lat))
