# Server file plots an example histogram based on the Test Pack score then computes an overall score
# based on the inputs.  If this prediction is above 71 then the student is encouraged to attempt the test 
# otherwise they are asked to do more work on their prescriptions.

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    hist(rnorm(input$testpack))
  })

  # start of text output
  output$text <- renderText({

    # here is a placeholder for the eventual predict model 
    # this is a simple calculation to simulate the ML process
    predictscore <- (((input$tabe * 8.33) * 0.1)
                     + ((input$accucess * 0.074) * 0.15)
                     + ((input$rxcomplete * 0.3))
                     + ((input$testpack * 0.4))
                     + ((input$timeontask *0.4) * 0.05))

    # best guess threshold for go - no go limit
  if (predictscore >= 71) textout = "you are READY for the Exam"
  if (predictscore < 71) textout = "you are not quite ready, try working on your Prescriptions"
    paste("Hello", input$name,"your overall score is", predictscore, "and",textout)
  })
})