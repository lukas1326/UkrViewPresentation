library(shiny)
library(tidyverse)

#url<-"https://population.un.org/wpp/DVD/Files/1_Indicators%20(Standard)/CSV_FILES/WPP2017_TotalPopulationBySex.csv"
#download.file(url,dest='data/WPP2017_TotalPopulationBySex.csv')

df<- read.csv('data/WPP2017_TotalPopulationBySex.csv')


library(shiny)
library(tidyverse)
library(scales)    
df<- read.csv('data/WPP2017_TotalPopulationBySex.csv')

ui <- fluidPage(
        titlePanel("Total Population by Sex"),
        selectizeInput("location",
                    "Location:",
                    choices = unique(sort(df$Location)),
                    selected = 'Ukraine',
                    multiple=TRUE),
        selectizeInput("variant",
                    "Variant:",
                    choices = unique(sort(df$Variant)),
                    selected="Medium",
                    multiple=TRUE
                    ),
        radioButtons('sex','Sex:',choices = list('Male'=1,
                                                       'Female'=2,
                                                       'Both'=3),
                                        selected = 3),
        sliderInput('slider_years','Choose period:',min = 1950,max=2100,value = c(1991,2030)),
        #leafletOutput("mymap"),
        # Create a new row for the table.
        #DT::dataTableOutput("table"),
        plotOutput('lineplot')
        
        )