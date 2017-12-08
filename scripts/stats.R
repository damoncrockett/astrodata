df = read.csv("astro_tag.csv")
d = d[!is.na(d$lat),]

cor.test(d$lat,d$accuracy)
cor.test(d$lon,d$accuracy)

library(ggplot2)
ggplot(d,aes(lon,accuracy)) + geom_point() + stat_smooth()

ggplot(d[d$accuracy < 5,],aes(lon,lat)) +
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
  geom_point(shape=21,color="yellow",fill="dodgerblue",size=10)

library(MASS)

ggplot(d,aes(lon,lat)) +
#ggplot(d[d$lat<0,],aes(lon,lat)) +
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
  #geom_point(color="yellow",size=5, alpha=0.5) +
  geom_density2d(n=100,color="yellow")

density.estimate = kde2d(d$lon,d$lat,n=100,lims=c(range(d$lon),range(d$lat)))
X <- density.estimate
m <- max(X$z)
idx <- which(X$z==m,arr.ind=1)
X$x[idx[1]]
X$y[idx[2]]



# geo dispersion

df = read.csv("tmp_geo.csv")

unique.users = unique(df$user_nid)

for (i in 1:27) {
  tmp <- df[df$user_nid==unique.users[i],]
  X <- data.matrix(tmp[c(2,3)])
  print(det(cov(X)))
}

cov(X)
