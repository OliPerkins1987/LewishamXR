
library(shiny)
library(googlesheets)
library(rJava)
library(mailR)
library(dplyr)


gs_auth()
sheets <- gs_ls()

data   <- gs_key('19x8pJJOChzwZojCZeYXix_uapS9ReB8XzwnkDrNKk8o')

ui <- fluidPage(
  
  h1('Lewisham XR New Joiners Email'),
  
  h4('Press the Button, then wait until your browser reloads'),
  
  hr(),
  
  column(6, align = 'center', actionButton('sendnewjoiners', label = 'Update module data with new modules'))

)


server <- function(input, output, session) {
  
  observeEvent(input$sendnewjoiners, 
               
               {
                 

                 sender <- "oliverperkins1987@gmail.com"
                 recipients <- c("oliverperkins@live.co.uk", 'oliverperkins1987@gmail.com')
                 
                 
                 send.mail(from = sender,
                           to = recipients,
                           subject = "Subject of the email",
                           body = "Body of the email",
                           smtp = list(host.name = "smtp.gmail.com", port = 587, 
                                       user.name = "olliereverserett@gmail.com",            
                                       passwd = "reverseRett", tls = TRUE),
                           authenticate = TRUE,
                           send = TRUE)
                 
                 
               })
  
}

  
  