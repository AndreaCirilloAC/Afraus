
shinyServer(function(input, output,session) {
  ####
{
  # deprecated
  # observe({
  #  if (input$browse == 0) return()else{
  #  updateTextInput(session, "pathpointer",  value = file.choose())}
  #  })
}
observe({
  if(input$demo) updateButton(session,"demo",style="success") else
  {updateButton(session,"demo",style="primary")}
  
})

  
# assigning the loaded file to a data.frame
  path<- reactive({   
      if (input$load == 0) return()else{
         file <-  input$load   
         file <- read.table(file$datapath,header= TRUE,sep=";")}          
  })
  
  wrangled_data <- reactive({
    if (input$findbutton == 0) return()else{
      
        if(input$demo==TRUE){
          data <- read.table("demo.csv",header=TRUE,sep=";")}else{
            data <- data.frame(path())}
        isolate({ source("main.R",local =TRUE, verbose = TRUE)})}
    return(data)
  })
# instruction to obtain the general response and the overall probability
# response

output$response     <- renderText({
  if (input$findbutton == 0) return()else{
{
  
  if(sum(wrangled_data()$afraus_score)>0){return(c("Fraud may be occuring on your data"))}
  else{("Afraus didn't find any fraus track")}
}
  }})
# probability
output$probability <- renderText({
  if (input$findbutton == 0) return()else{
{
  
  paste(round(median(wrangled_data()$afraus_score)*100,0),"%",sep="")}}
})  
# plot representing afraus_score distribution
  output$afraus_plot <- renderPlot({
      if(input$findbutton == 0)return()else{
       withProgress(message= 'Afraus is working',
                     detail = 'calculation time depends on data size',value = 0,{
        if(input$demo==TRUE){
          
          data <- read.table("demo.csv",header=TRUE,sep=";")}else{
            data <- data.frame(path())}
        incProgress(30)
         isolate({ source("main.R",local =TRUE, verbose = TRUE)})
        incProgress(70)
         m    <- ggplot(data, aes(x=afraus_score ))
        incProgress(100)
        
        Sys.sleep(0.5)
         m + 
         geom_histogram(aes(fill = ..count..))+
         geom_density()
       
       })
  }
})
output$afraus_plot_cor <- renderPlot({ 
  if(input$findbutton){
    if(input$demo==TRUE){
      data <- read.table("demo.csv",header=TRUE,sep=";")}else{
        data <- data.frame(path())}
    isolate({ source("main.R",local =TRUE, verbose = TRUE)})
    m <- ggplot(data, aes(x=afraus_score,y=value,color=value))
    m +  geom_point(shape=1)
  }
})
output$afraus_plot_cor_mod <- renderPlot({
  
  if(input$findbutton == 0)return()else{
    if(input$demo==TRUE){
      data <- read.table("demo.csv",header=TRUE,sep=";")}else{
        data <- data.frame(path())}
    isolate({ source("main.R",local =TRUE, verbose = TRUE)})
    
    m <- ggplot(data, aes(x=date,y=afraus_score,color=value))
    m +  geom_point(shape=1)
  }
})

# instruction to make the 'find the fraud' button work
observe({
  if(input$gofind){
updateTabsetPanel(session, "bar", selected = "Find the Fraud")
}

})
# instruction to make the 'discover more about the math' link work
observe({
  if (input$math){updateTabsetPanel(session, "bar", selected = "How it works")}
})
# details table code
# table is showed only after afraus_score computation
output$details <- renderDataTable({
  if (input$findbutton) {
    if ( input$demo == TRUE) {
      data <- read.table("demo.csv",header = TRUE,sep =";")}else{
        data <- data.frame(path())}
    isolate({ source("main.R",local = TRUE, verbose = TRUE)})
    data <- data.frame("date" = data$date,"value" = data$value,"afraus_score"=data$afraus_score)
    data <- subset(data,data$afraus_score>0.5)
    data <- data[order(data$afraus_score,decreasing = TRUE),]}
  
     return(data)
  })
observe({
 if (input$findbutton) {
updateCollapse(session,"collapser",open = c('results'))}
})
})
