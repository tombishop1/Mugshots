# setup
library(imager)
library(dplyr)

# setup plot area
pdf(file = "output/staff.pdf", 
    height = 16.5,
    width = 11.7)

# plot
par(mfrow = c(6, 4), 
    mar = c(1,1,1,1),
    oma = c(1,1,3,1))
for(i in list.files("data", full.names = TRUE)){
  plot(load.image(i), 
       axes = FALSE, 
       main = unlist(strsplit(i, split = "/"))[2] %>% 
         strsplit(., split = "[.]") %>%
        unlist(.) %>%
        first()
      )
}

mtext("Mugshots", side = 3, line = 1, outer = TRUE)

# finish
dev.off()
