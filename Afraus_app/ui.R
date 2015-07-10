library(lubridate)
library(assertthat)
library(DMwR)
library(shinyBS)
library(shinythemes)
library(shiny)
library(ggplot2)
library(RCurl)
# http://stackoverflow.com/questions/26547589/insert-a-link-into-the-navbar-in-shiny

shinyUI(navbarPage(theme = "bootstrap.css",img(src = "logo.png", height = 25, width = 25) ,id ="bar",
              #HOME PANEL     
                   
                   tabPanel("home",
                                  
                   div(style = " text-align: center;",
                       h3("Fraud costs the world 3.7 trillion every year."),
                       h2("Afraus brings to you the power of data analysis and lets you discover frauds
                          affecting your numbers"),
                       br(),
                       br(),
                       
                       img(src = "logo.png", height = 100, width = 100,align = "center"),
                       h6("beta version")
                       ),                   
                   br(),
                   br(),
                   div(style=" text-align: center;",                             
                              bsButton("gofind", label="find the fraud",  style = "warning",
                                       size = "large", disabled = FALSE
                                       )),
                   br(),br(),br(),br(),br(),br(),
                   div(style=" text-align: center;",                  
                       fluidRow(
                       column(4,
                       img(src = "upload.png", height = 100, width = 100,align="center"),
                       h3("1. Load your data into Afraus (privacy mode on)")),
                       column(4,
                       img(src = "pulse.png", height = 100, width = 100,align="center"),
                   h3("2. Find if any fraud may be occuring")),
                   
                   column(4,
                   img(src = "paper.png", height = 100, width = 100,align="center"),
                   
                   h3("3. Discover which records may be affected by fraud")
                 )),
                   br(),
                   br()
                   )
                   ),
                     
                   
              #APPLY AFRAUS PANEL
                   
                   tabPanel("Find the Fraud",
                            div(
                              style=" text-align: center;",
                              h1("Apply Afraus to your data")),
                            br(),br(),br(),br(), br(),
                            fluidRow(     
                            column(6,
                                   
                                   
                                   h2("load your data (or select demo mode)"),                                   
                                   h4("Afraus puts togheter the best unsupervised models to let you spot
                                                 frauds that are affecting your numbers."),
                                   actionLink("math","discover more about the math"),
                                   br(),
                                   
                                   h4("Test Afraus with your data or using the 'try a demo' button. 
                                      Data have to be arranged as showed in the table on the right:"),
                                   h4(" - a 'date' column;"),
                                   h4(" - a 'value' column."),
                                   h4("only .csv file ar supported at the moment"),
                                   
                                   div(
                                     style = " text-align: center;", 
                                   img(src = "upload.png",  width = "30%",align="center"),
                                   br(),
                                   #actionButton("browse", "Upload your File"),
                                   fileInput('load',"") ,
                                   bsButton("demo","try a demo")
                                   )       ),
                                     column(6,
                                            img(src = "sceen_upload.png", width = "100%" ,align="center")                                           
                                                )
                            ),
                            br(),
                            br(),
                            br(),                 
                            fluidRow(      
                              column(6,
                                     img(src = "codescreen.png", width = "100%" ,align="center")
                                     ),
                              column(6,
                                     h2("apply Afraus"),
                                     h4("You don't have to know anything about data analysis
                                                 and fraud schemes: just load your data, press 
                                        'Show me the fraud' and look what happens."),
                                     div( style=" text-align: center;", 
                                     img(src = "pulse.png",width = "30%",align="center"),
                                     br(),
                                     bsButton("findbutton", "Show me the fraud",style="primary"),
                                     br(),
                                     br()
                              )
                                    )),          
                            br(),
                            br(),
                            fluidRow(
                              div(
                                style=" text-align: center;", 
                                column(6,
                                       img(src = "paper.png", width = "30%" ,align="center")
                                ),
                                column(6,
                                       h2("see which records are breaking the rules")
                                )
                              )),
                            hr(),
                            
                            bsCollapse(
                                    
                                       bsCollapsePanel(title = "results",
                                        
                                         fluidRow(
                                           div(
                                             style = " text-align: center;", 
                                             column(6,
                                                    h3("Afraus response"),
                                                    h1(textOutput('response'))     
                                             ),
                                             column(6,
                                                    h3("probability of fraud presence"),
                                                    h1(textOutput('probability'))
                                             ))),
                                         hr(),       
                                         br(),
                                         br(),
                                         h4("Afraus score distribution"),
                                         p("Afraus score is an index going from 1 to 100 expressing 
                                           the likelihood of that particular record being affected by fraud."),
                                         p("An afraus score bigger than 50 (0.5) 
                                           states that the record is more likely to be generating from fraud that not."),
                                         div(style="text-align: center;",
                                             fluidRow(
                                               column(12,plotOutput("afraus_plot")))),
                                         h4("Afraus score correlation"),
                                         p("find below two charts showing the correlation 
                                           between afraus score and time ( left chart) and 
                                           between afraus score and value (right chart)"),
                                         div(style = "text-align: center;",
                                             fluidRow(
                                               column(8,plotOutput("afraus_plot_cor_mod")),
                                               column(4,plotOutput("afraus_plot_cor")))),
                                         div(style = "text-align: center;",
                                             fluidRow(
                                               h3("afraus_score details (score > 0.5)")
                                             )
                                         ),
                                         fluidRow(
                                           column(12,        
                                                 dataTableOutput('details')) 
                                         )
                                       
                                        ),
                                       id = "collapser", multiple = FALSE, open = NULL
                                       )
                      
                           ),   
                    
                  
              #HOW IT WORKS PANEL
                   
                     tabPanel(HTML("How it works</a></li><li><a style='color:#3399FF' 
                                   href=\"https://it.linkedin.com/in/cirilloandrea\">by Andrea Cirillo</a>"),
                             div(
                               style = " text-align: center;",  
                             fluidRow(column(4),
                                      column(4,
                               h1("How Afraus works")),
                               column(4)
                               ),
                             fluidRow(
                               column(2),
                               column(8,img(src = "eye.png", height = 100, width = 100,align = "center"),
                                          h4("fraudster usually leaves tracks behind them, generating
                                          numbers that breaks statistics laws and rules.")),
                               column(2)),
                               fluidRow(
                                 column(2),
                             column(8,img(src = "podium.png", height = 100, width = 100,align = "center"),
                                      h4("those laws and rules are applicable to nearly all kind of data, no
                                          matter the business domain that generated them.")),
                             column(2)),
                             fluidRow(
                               column(2),
                             column(8,    img(src = "thunderstorm.png", height = 100, width = 100,align = "center"),
                                          h4("Afraus looks for those numbers that breaks laws and rules,
                                              giving you an hint on where to look
                                          to discover frauds affecting your number.")),
                                    column(2))),
                                   br(),
                             fluidRow(
                               column(2),
                               column(8,
                                      h3("inside the math"),
                                      br(),
                                      br(),
                                      
                                      h4(" Have you noticed that Afraus didn't ask you for any specification or parameter?"),
                                      p("This is made possibile by the use of unsupervised algorithms and models. Afraus is based on the following three models:"),
                                      tags$b("Benford's Law"),
                                     p("this model tests the data against a theorical distribution of first digits, 
                                        highlighting those records that significantly deviates from that distribution. This test has proven to be effective for the most
                                        different kinds of anomaly detection, from tax frauds to social network suspicious behaviour. Generally speaking, Benford's
                                       law is really good at looking for manipulation on datasets as a whoole. Afraus knows that, and use it to understand how
                                       'clean' is the population of data you loaded."),
                                     br(),
                                     br(),
                                     div(
                                       style = " text-align: center;",  
                                     img(src = "benford.png",width = "40%",align = "center")),
                                      tags$b("Control Chart"),
                                      p("Control charts are known as a reliable tools for statistical process controll. those kind of models derive from data a center line
                                        an upper and a lower bound, highlighting as out of control all records out of those limits. Afraus leverage
                                        the robustness of those charts to identify atypical data"),
                                     br(),
                                     br(),
                                     div(
                                       style = " text-align: center;",  
                                     img(src = "control_chart.png",width = "40%",align = "center")),
                                      tags$b("Local Outlier Factor"),
                                     p("Local Outlier Factor is a k-NN algorithm, based on the concept of density: the more isolated is a record,
                                       the highier is the likelihood it is orignating from fraud. Afraus use the LOF to intercept isolated values."),
                                      p("At the end of each model processing a subscore is applied, going from 1 to 100. 
                                        Those score are then averaged in order to obtain the Afraus score"),
                                     br(),
                                     br(),
                                     div(
                                       style = " text-align: center;",  
                                     img(src = "lof.png",width = "40%",align = "center")),
                               tags$b("the final score"),
                               p("In giving the final score, Afraus leverages the concept of 'complementarity'. 
                                 This concepts assumes that complementary models, applied togheter can give better results than single models on their own."),
                               p("This concept leads Afraus to calculate the Afraus score as a weighted average of the score deriving from the other models.")     
                                      ))
                             ),
          
              #SCRIPTS
              
                   tags$head(includeScript("analytics.js"))  ,
                   includeScript("jivo.js"),  
                   windowTitle = "Afraus"
  
  ))