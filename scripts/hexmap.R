library(ggplot2)
df = read.csv("astro_tag.csv")
str(df)

ggplot(df,aes(lon,lat)) +
  #borders(database = "world",
  #        colour="grey75",
  #        fill="white") +
  theme(panel.background = element_rect(fill="white"),
        panel.grid.major = element_line(color="white"),
        panel.grid.minor = element_line(color="white"),
        plot.background = element_rect(fill="white"),
        legend.position="none",
        axis.text = element_text(size=rel(0.1),color="white"),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_blank(),
        text = element_text(face="plain",color="white",size=15)) +
  stat_binhex(bins=90)