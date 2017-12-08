library(ggplot2)

d = read.csv("astro_tag.csv")
df = read.csv("peaks.csv")
df$num = c(1:length(df$lat))

ggplot(d,aes(lon,lat)) +
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
  geom_point(shape=21,alpha=0.25,fill="dodgerblue",size=5,color="grey45") +
  geom_point(data=df[c(1:4),],aes(lon,lat),color="yellow",size=50,alpha=.5) +
  geom_text(data=df[c(1:4),],aes(lon,lat,label=num),size=30,color="white",alpha="0.5")


