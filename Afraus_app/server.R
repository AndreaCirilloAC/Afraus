
'library(GGally)'
'library(gpairs)'
shinyServer(function(input, output,session) {
# assigning the loaded file to a data.frame
  path<- reactive({
    file <-  input$inputdata  
    file <- read.csv(file$datapath,header= TRUE,sep=";")          
  })
  
  # plot representing afraus_score distribution
output$afraus_plot <- renderPlot({
  
  if(input$findbutton){
  data <- data.frame(path())
 
 isolate({ source("main.R",local =TRUE, verbose = TRUE)})
  m <- ggplot(data, aes(x=afraus_score ))
  m + geom_histogram(aes(fill = ..count..))+
    geom_density()
  }
})
output$afraus_plot_cor <- renderPlot({
  
  if(input$findbutton){
    data <- data.frame(path())
    isolate({ source("main.R",local =TRUE, verbose = TRUE)})
    m <- ggplot(data, aes(x=afraus_score,y=value,color=value))
    m +  geom_point(shape=1)
  }
})
output$afraus_plot_cor_mod <- renderPlot({
  
  if(input$findbutton){
    data <- data.frame(path())
    isolate({ source("main.R",local =TRUE, verbose = TRUE)})
    m <- ggplot(data, aes(x=date,y=afraus_score,color=value))
    m +  geom_point(shape=1)
  }
})
# instruction to make the 'find the fraud' button work
observe({
  if(input$gofind){
  
 isolate(updateTabsetPanel(session, "bar", selected = "Find the Fraud"))}
})
})
