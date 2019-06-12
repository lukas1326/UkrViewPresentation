server <- function(input, output, session) {
        #url<-"https://population.un.org/wpp/DVD/Files/1_Indicators%20(Standard)/CSV_FILES/WPP2017_TotalPopulationBySex.csv"
        #download.file(url,dest='data/WPP2017_TotalPopulationBySex.csv')
        df<- read.csv('data/WPP2017_TotalPopulationBySex.csv')

        df_subset <- reactive({
                req(input$location)
                req(input$variant)
                df %>% filter(Location %in% input$location,Variant %in% input$variant)
        })

output$table <- DT::renderDataTable({
        data <-df_subset()
        
        #data <- data %>% select(V_Name,risk,H_active,VEI_Holoce,hazard)
        
        DT::datatable(data = data, 
                      options = list(pageLength = 10), 
                      rownames = FALSE)
})
output$lineplot<-renderPlot({
        ggplot(data=df_subset(),
               aes(x=Time,y=PopTotal))+
                geom_line()
})

}
