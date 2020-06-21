library(RSelenium)
library(XML)
library(janitor)
library(lubridate)
library(magrittr)
library(dplyr)


remDr <- remoteDriver(port = 4445L)
remDr$open()

remDr$navigate("https://www.worldometers.info/coronavirus/")
remDr$getTitle()
remDr$screenshot(display = TRUE)
tableElem <- remDr$findElement(using = "id", "main_table_countries_today")
tableElem 
doc <- htmlParse(remDr$getPageSource()[[1]])
table_tmp <- readHTMLTable(doc)
table_tmp