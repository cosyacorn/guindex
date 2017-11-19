#read google sheet, cleanse data and write to csv

#install.packages("googlesheets")

library("googlesheets")

gs_ls()

pubs <- gs_title("pubs_f.csv")

gs_ws_ls(pubs)

pubs_data <- gs_read(ss=pubs, ws="pubs_f.csv")

pubs_data$X1 <- NULL

pubs_data$`Price of Guinness` <- lapply(pubs_data$`Price of Guinness`, gsub, pattern = "€", replacement = "")
pubs_data$`Price of Guinness` <- lapply(pubs_data$`Price of Guinness`, gsub, pattern = "N.A.", replacement = NA)

pubs_data$`Price of Guinness` <- as.numeric(as.character(pubs_data$`Price of Guinness`))

head(pubs_data)

print(summary(pubs_data))

hist(pubs_data$`Price of Guinness`,
     breaks = seq(
       min(pubs_data$`Price of Guinness`,na.rm = TRUE),
       max(pubs_data$`Price of Guinness`,na.rm = TRUE),
       by=0.1))
