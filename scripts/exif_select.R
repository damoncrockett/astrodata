df = read.csv("exif_select.csv")
df$date = as.Date(df$date)

library(ggplot2)

ggplot(df,aes(date)) + geom_histogram(bins=200, color="grey75",fill="white") +
  theme(panel.background = element_rect(fill = "grey25"),
        panel.grid.major = element_line(color = "grey25"),
        panel.grid.minor = element_line(color = "grey25"),
        plot.background = element_rect(fill = "grey25"),
        legend.position="none",
        axis.text = element_text(size=rel(0.75), color='white'),
        text = element_text(color='white', size = 15))


tmp = df
tmp = tmp[tmp$ISO!="missing",]
tmp = tmp[tmp$ISO!="65535+0+0",]

tmp$ISO = as.numeric(as.character(tmp$ISO))

ggplot(tmp[tmp$ISO < 20000,], aes(date,ISO,color=galaxy)) + geom_point(alpha=0.25) +
  theme(panel.background = element_rect(fill = "black"),
        panel.grid.major = element_line(color = "black"),
        panel.grid.minor = element_line(color = "black"),
        plot.background = element_rect(fill = "black"),
        legend.position="none",
        axis.text = element_text(size=rel(0.75), color='white'),
        text = element_text(color='white', size = 20)) +
  labs(title="ISO by Year in Flickr! CC 100M",
       x = "Year",
       y = "ISO") +
  scale_color_manual(values = c("dodgerblue","yellow"))
