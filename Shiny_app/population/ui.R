library(shiny)
library(tidyverse)

#url<-"https://population.un.org/wpp/DVD/Files/1_Indicators%20(Standard)/CSV_FILES/WPP2017_TotalPopulationBySex.csv"
#download.file(url,dest='data/WPP2017_TotalPopulationBySex.csv')

df<- read.csv('data/WPP2017_TotalPopulationBySex.csv')


library(shiny)
library(tidyverse)
df<- read.csv('data/WPP2017_TotalPopulationBySex.csv')

ui <- fluidPage(
        titlePanel("Total Population by Sex"),
        selectInput("location",
                    "Location:",
                    choices = unique(sort(df$Location))),
        selectInput("variant",
                    "Variant:",
                    choices = unique(sort(df$Variant))),
        #leafletOutput("mymap"),
        # Create a new row for the table.
        #DT::dataTableOutput("table")
        plotOutput('lineplot')
        
        )