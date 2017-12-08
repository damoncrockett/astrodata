df = read.csv("astro_tag_exif_autotags_clean_quality.csv")
df = df[!is.na(df$size),]
library(ggplot2)

#----------
# ISO 
#----------

iso = df[df$ISO!="",]
iso$ISO = as.character(iso$ISO)
#iso$ISO[3355] = "65535"
iso$ISO = as.numeric(iso$ISO)
#iso = iso[iso$ISO < 15000,] # for Year x ISO plot
iso = iso[iso$ISO < 26000,] # for Sensor Size x ISO plot

the.rest = c("PENTAX","KODAK","SBIG","APPLE","SAMSUNG","MINOLTA",
             "LEICA","HP","ERICSSON","SIGMA","GE","CASIO","RICOH",
             "BENQ","","HTC","LUBITEL","MOTOROLA","NOKIA","NORITSU")

makeplot = as.character(iso$make)

for (i in 1:3556) {
  if (makeplot[i] %in% the.rest) {
    makeplot[i] = "MINOR"
  }
}

iso$makeplot = factor(makeplot)

colors = c("#01319c","#a4a4a7","#ffc801","#3d95ed","#e85a01","#a5a715","#fd4dd0")

ggplot(iso,aes(size,ISO,color=makeplot,size=emp,shape=type,label=capture_device)) + 
  geom_point(stroke=0.5) +
  #scale_shape_manual(values=c(11,15,16,18,8,17)) +
  #scale_shape_manual(values=c(11,0,1,5,8,2)) +
  scale_shape_manual(values=c(0,1,5,8,2)) +
  scale_size_continuous(range = c(1,36)) +
  scale_color_manual(values = colors) +
  theme(panel.background = element_rect(fill = "black"),
        panel.grid.major = element_line(color = "white",size=0.25),
        panel.grid.minor = element_line(color = "white",size=0.25,linetype="dashed"),
        plot.background = element_rect(fill = "black"),
        text = element_text(color="white"),
        axis.text = element_text(color="white",size=15),
        legend.position = "none") +
  labs(x="Sensor Size (mm^2)",y="ISO")
#geom_text_repel(data=subset(df,df$count > 100),color="white",size=4)


ggsave(filename="/Users/damoncrockett/Desktop/astrophotography_data/quality-EXIF-ISO-size.png",
       width=17,height=17,units="in")


