# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
# Define a server for the Shiny app

function(input, output) {
  # Fill in the spot we created for a plot
  
  
  output$comparacion <- renderPlot({
    
    tab <- iris[iris$Species ==input$Especie,input$Medida ]
    tab1<- tab[sample(50,input$Datos,replace = FALSE)]
    # Render a barplot
    barplot(tab1,
            main=input$Medida,
            ylab="Longitud/Anchura",
            xlab="Numero de muestras",
            col = "#75AADB",
            border = "white")
    
    abline(h=mean(iris[iris$Species ==input$Especie,input$Medida ]), lwd=2)
    abline(h=mean(tab[sample(50,input$Datos,replace = F)]), col="Red",lwd=2)
  })
  output$hist <- renderPlot({
    
    tab <- iris[iris$Species ==input$Especie,input$Medida ]
    tab1<- tab[sample(50,input$Datos,replace = FALSE)]
    hist(tab1,
         main=input$Medida,
         freq = F,
         ylab="Numero de muestras",
         xlab="Longitud/Anchura",
         col = "#75AADB",
         border = "white")
    lines(density(tab1),col="Red",lwd=2)
  })
  output$Tabla <- renderTable({
    tab <- iris[iris$Species ==input$Especie,]
    tab1<- tab[sample(50,input$Datos,replace = F),]
    tab1
  })
  output$Resumen1 <- renderPrint({
    tab <- iris[iris$Species ==input$Especie,input$Medida,input$Datos]
    tab1<- tab[sample(50,input$Datos,replace = F)]
    summary(tab1)
    
  })
  
  output$table <- renderTable({
    tab <- iris
    #tab1<- tab[sample(50,input$Datos,replace = FALSE)]
    table(tab)
    
    
  })
}