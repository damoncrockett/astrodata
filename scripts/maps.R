#df = read.csv("astro_tag_exif_autotags_clean_quality.csv")
df = read.csv("./astro_tag.csv")
#df = df[!is.na(df$size),]
library(ggplot2)

#df = df[df$type=="dslr",]

ggplot(df,aes(lon,lat,z=accuracy)) +
  borders(database = "world",
          colour="grey65",
          fill="grey55",
          size=0.1) +
  stat_summary_hex(bins=90,fun=mean) +
  #scale_size_continuous(range=c(.1,9)) +
  #scale_shape_manual(values=c(11,0,1,5,8,2)) +
  theme(panel.background = element_rect(fill="grey75"),
        panel.grid.major = element_line(color="grey75"),
        panel.grid.minor = element_line(color="grey75"),
        plot.background = element_rect(fill="grey75"),
        legend.position="none",
        axis.text = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        text = element_blank())

ggsave(filename="/Users/damoncrockett/Desktop/astrophotography_data/map-glyph-acc.png",
       width=7.5,height=4.25,units="in",limitsize=0)

cor.test(df$lat,df$size)
qplot(df$size,df$lat) + stat_smooth()
