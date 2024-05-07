library(shiny)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "nome", label = "escreva seu nome"),
      dateInput(inputId = "nascimento", label = "insira sua data de nascimento"),
      checkboxGroupInput(inputId = "sexo", label = "marque seu sexo", choices = c("Masculino","Feminino")),
      sliderInput("n", label = "numero da sorte", min = 1, max = 100, value = 50),
      actionButton(inputId = "enviar", label = "enviar")
    ),
    mainPanel(
      textOutput("ganhou_perdeu")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$enviar, {
    numero_aleatorio <- runif(1, min = 1, max = 100)
    det <- abs(input$n - numero_aleatorio)
    output$ganhou_perdeu <- renderText({
      if(det < 10) {
        paste("Olá", input$nome,"voce ganhou!!")
      } else {
        paste("Olá", input$nome,"voce perdeu!!")
      }
    })
  })
}

shinyApp(ui, server)
