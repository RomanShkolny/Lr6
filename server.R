f <- function(a, b){
  y <- b-2*(a/b);
}

Calculation <- function(x1,y1,y_prev,h)
{
  h1 <- (y1 - x1) / h;
  row <- as.integer(h1);
  if(row >0)
  {
    data <- matrix(nrow = row, ncol = 2) 
    for(i in 0:h1){
      k1 <- f(x1, y1);
      k2 <- f(x1 + h / 2, y1 + k1 * h / 2);
      k3 <- f(x1 + h / 2, y1 + k2 * h / 2);
      k4 <- f(x1 + h, y1 + h * k3);
      y0 <- y_prev + (k1 + 2 * k2 + 2 * k3 + k4)*(h/ 6);
      x0 <- x1 + h;
      data[i,1] <- x0;
      data[i,2] <- y0;
      y1 <- y0;
      x1 <- x0;
      
    }
  }else return(0)
  return(data)
}

function(input, output) {
  
  output$text <- renderPrint({
    list(Calculation(input$a, input$b, input$y, input$step))
  })
  output$plot <- renderPlot({
    data <- Calculation(input$a, input$b, input$y, input$step);
    if(data > 0)
    {
    cx <- data[,1];
    cy <- data[,2];
    plot(cx, cy, type = "o", log = "xy", xlab = "X", ylab = "Y", col = "#750db1")
   
    }
  })
}