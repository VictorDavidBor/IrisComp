
library(datasets)

a<-names(table(iris$Species))

# Use a fluid Bootstrap layout
fluidPage(
  # Give the page a title
  titlePanel("Estudio flor Iris"),
  
  # Generate a row with a sidebar
  sidebarLayout(
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("Especie", "Especie:",
                  choices=a),
      selectInput("Medida"," Parte:",
                  choices=colnames(iris[,1:4])),
      sliderInput("Datos","Nº de muestras: ",
                  min=1,max=50, value=50),
      
      
      br(),
      helpText("Datos de Edgar Anderson de la flor Iris")
    ),
    
    
    # Create a spot for the barplot
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Grafico",plotOutput("comparacion",height = "600px")),
                  tabPanel("Histograma", plotOutput("hist")),
                  tabPanel("Tabla", tableOutput("Tabla")),
                  navbarMenu("Mas",
                             tabPanel("Summary",
                                      verbatimTextOutput("Resumen1")
                             ),
                             tabPanel("About",
                                      fluidRow(
                                        column(12,
                                               includeMarkdown("README.md")
                                        ),
                                        column(6,
                                               img(class="img-polaroid",
                                                   src=paste0("http://1.bp.blogspot.com/-V8v6_Mx0s-4/Tspi86KLzZI/AAAAAAAAAOY/M3b8lF6Qto0/s400/Partes+de+la+flor.jpg")),
                                               tags$small(
                                                 "Source: Ciencias y Naturaleza de las Plantas ",
                                                 a(href="https://sites.google.com/site/fcehimpla/1-las-plantas-tienen-partes-muy-importante/2-3-flor",
                                                   "User:fcehimpla")
                                               )
                                        )
                                      )
                             ))))
  )
)
