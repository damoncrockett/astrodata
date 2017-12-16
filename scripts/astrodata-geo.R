setwd("~/astrodata/tables/")
df = read.csv("astrodata_moon_galaxy.csv")
TARGET = "/Users/damoncrockett/Desktop/usermaps/"

library(ggplot2)

rev(sort(table(df$user_nid)))

for (user in unique(df$user_nid)) {
  tmp = df[df$user_nid==user,]
  
  ggplot(tmp,aes(lon,lat)) +
    borders('world',
            colour='grey95') +
    geom_point(size=10,alpha=0.5) +
    theme(panel.background = element_rect(fill='white'))
  
  #ggsave(paste0(TARGET,user,".png"))
}

candidate.colors = c("#01319c","#a4a4a7","#ffc801","#3d95ed","#e85a01","#a5a715","#fd4dd0")

ggplot(data.frame(l=c('a','b','c','d','e','f','g')),
       aes(l,fill=l)) +
  geom_bar() +
  scale_fill_manual(values=candidate.colors)

ggplot(df,aes(lon,lat)) +
  borders(database = "world",
          colour="#01319c",
          fill="#001747",
          size=1) +
  theme(panel.background = element_rect(fill="black"),
        panel.grid.major = element_line(color="black"),
        panel.grid.minor = element_line(color="black"),
        plot.background = element_rect(fill="black"),
        legend.position="none",
        axis.text = element_blank(),
        text = element_blank(),
        axis.ticks = element_blank()) +
  geom_point(size=5,shape=1,color="#ffc801")

setwd("~/Desktop/")
ggsave("astrodata-map.png",
       width=102.4,
       height=57.6,
       unit = "in",
       limitsize=0)
  
  
  
  
