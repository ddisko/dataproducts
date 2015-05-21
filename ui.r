library(shiny)

# Define UI for Project Demo
# Problem Statement - Adult Students and Teachers need a way to gauge readiness to take a 
# High School Equiv. Exam or HSE like GED, TASC or HiSET.
# Normally one would rely on grades or seat time to predict readiness for an exam but due to the unique 
# demographics of this student population the likelihood of passing the exam is depends on several key factors.
# From a large group of representative data where some students pass an HSE and some fail that test 
# we take various features like prelim assessment scores, scores from prescriptive work, practice test scores
# time on task to develop a Machine Learning - ML prediction of final success on the target exam.

# For the purposes of this example we will assume the background ML work has already been done and a 
# Predict Model is loaded to the Shiny Server to take various inputs then show a liklihood of passing based on
# those inputs.  This allows a student more control over their fate when deciding if they are ready to test.
# The calculation represented here is a placeholder and is not a real predictor as data is currently being collected
# for this project.  The prediction used here is based on a best-guess simple model calculation performed 
# in the Server.R file.

shinyUI(fluidPage(
  titlePanel("Are You Ready For Your Test?"),
  helpText("Please enter the following scores from your student account then Click the Run Check button to measure your readiness"),
  fluidRow(
    column(3, wellPanel(
      # Intake TABE Score
      sliderInput("tabe", "TABE Score:", min = 1, max = 12, value = 1, step = .1),
      
      # Most Recent Accucess Score
      sliderInput("accucess", "Most Recent Accucess Score:", min = 100, max = 1350, value = 100),
      
      # Time on Task
      sliderInput("timeontask", "Time on Task (in hours):", min = 10, max = 250, value = 1),
      
      # Percentage of Prescriptive Lessons Complete
      sliderInput("rxcomplete", "Prescriptions Completed:", min = 0, max = 100, value = 1),
      
      # Test Pack Score
      sliderInput("testpack", "Test Pack Score:", min = 1, max = 100, value = 1),
      
      textInput("name", "Please Enter Your First Name:", " "),
      submitButton("Run Check")
    )),
    column(6,
           plotOutput("plot1", width = 400, height = 300),
           verbatimTextOutput("text")
    )
  )
)
)