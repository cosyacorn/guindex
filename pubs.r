

library("googlesheets")

gs_ls()

pubs <- gs_title("pubs_f.csv")

gs_ws_ls(pubs)

pubs_data <- gs_read(ss=pubs, ws="pubs_f.csv")

pubs_df <- as.data.frame(pubs_data)

head(pubs_df)

pubs_df$`Price of Guinness`[pubs_df$`Price of Guinness` %in% ""] <- "0"

gsub("€","",pubs_df$`Price of Guinness`)

as.numeric(as.character(pubs_df$`Price of Guinness`))

pubs_df$pricecleaned <- NA

unique(pubs_df$`Price of Guinness`)


print(summary(pubs_df))
