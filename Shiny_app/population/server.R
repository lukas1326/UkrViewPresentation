server <- function(input, output, session) {
        #url<-"https://population.un.org/wpp/DVD/Files/1_Indicators%20(Standard)/CSV_FILES/WPP2017_TotalPopulationBySex.csv"
        #download.file(url,dest='data/WPP2017_TotalPopulationBySex.csv')
        df<- read.csv('data/WPP2017_TotalPopulationBySex.csv')

        df_subset <- reactive({
                req(input$location)
                #req(input$variant)
                df %>% filter(Location %in% input$location)#,Variant %in% input$variant)
        })

output$table <- DT::renderDataTable({
        data <-df_subset()
        
        #data <- data %>% select(V_Name,risk,H_active,VEI_Holoce,hazard)
        
        DT::datatable(data = data, 
                      options = list(pageLength = 10), 
                      rownames = FALSE)
})
output$lineplot<-renderPlot({
        theme_set(theme_bw())
        options(scipen=10000)
                ggplot(data=df_subset(),
               aes(x=Time,y=PopTotal,col=Variant))+
                geom_line()+
                labs(y='Population,thousands',x='Years')+
                theme(axis.text.x = element_text(angle = 90, vjust=0.5))+
                scale_x_continuous(breaks = seq(1950, 2100, by = 10))
       })

}
