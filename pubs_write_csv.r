#read google sheet, cleanse data and write to csv

#install.packages("googlesheets")

library("googlesheets")

gs_ls()

pubs <- gs_title("pubs_f.csv")

gs_ws_ls(pubs)

pubs_data <- gs_read(ss=pubs, ws="pubs_f.csv")

class(pubs_data)
head(pubs_data)

pubs_data$X1 <- NULL

pubs_data$`Price of Guinness` <- lapply(pubs_data$`Price of Guinness`, gsub, pattern = "€", replacement = "")

pubs_data$`Price of Guinness` <- lapply(pubs_data$`Price of Guinness`, gsub, pattern = "N.A.", replacement = NA)

unique(pubs_data$`Price of Guinness`)

pubs_data$`Price of Guinness` <- as.numeric(as.character(pubs_data$`Price of Guinness`))

head(pubs_data)

print(summary(pubs_data))
