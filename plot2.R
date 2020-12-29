library(psData)
psData::PolityGet()

data <- read.csv("vdem.csv", sep = ",", dec = ".")
names(data)
unique(data$country_name)

russia <- dplyr::filter(data, country_name == "Russia")
russia <- dplyr::filter(russia, year >= 1991)
plot(data = russia, v2x_libdem~year)

library(ggplot2)

ggplot(data = russia, aes(x = year, y = v2x_libdem))+
  geom_point(color = "steelblue")+
  geom_line(color = "steelblue", size = 1.5)+
  #geom_text(hjust=0, vjust=-1)+
  theme_minimal()+
  #ylim(c(43000, 44500))+
  geom_vline(xintercept = 2005, color = 'firebrick', size = 1.7) +
  geom_text(aes(x=2005, label="Direct governors elections cancelled", y = 0.32), colour="gray40", angle=90, vjust = 1,hjust = 1, text=element_text(size=10))+
  geom_vline(xintercept = 2012, color = 'darkolivegreen', size = 1.7) +
  geom_text(aes(x=2012, label="Direct governors elections returned", y = 0.32), colour="gray40", angle=90, vjust = 1,hjust = 1, text=element_text(size=10))+
  #ggtitle("Liberal democracy (dark blue) and polyarchy (lightblue) indexes scores for Russia")+
  ylab("Liberal democracy index score (max. value = 1)")



ggplot(data = russia, aes(x = year, y = v2x_libdem))+
  geom_point(color = "steelblue")+
  geom_line(color = "steelblue", size = 1.5)+
  #geom_text(hjust=0, vjust=-1)+
  geom_point(aes(x = year, y = v2x_polyarchy),color = "lightblue")+
  geom_line(aes(x = year, y = v2x_polyarchy),color = "lightblue", size = 1.5)+
  theme_minimal()+
  #ylim(c(43000, 44500))+
  geom_vline(xintercept = 2005, color = 'firebrick', size = 1.7) +
  geom_text(aes(x=2005, label="Direct governors elections cancelled", y = 0.4), colour="gray40", angle=90, vjust = 1,hjust = 1, text=element_text(size=10))+
  geom_vline(xintercept = 2012, color = 'darkolivegreen', size = 1.7) +
  geom_text(aes(x=2012, label="Direct governors elections returned", y = 0.4), colour="gray40", angle=90, vjust = 1,hjust = 1, text=element_text(size=10))+
  #ggtitle("Liberal democracy (dark blue) and polyarchy (lightblue) indexes scores for Russia")+
  ylab("Indexes score (max. value = 1)")


ggplot(data = russia, aes(x = year, y = v2x_libdem))+
  geom_point()
