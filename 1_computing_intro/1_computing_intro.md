## Programming

### Background

Computer programming is an indispensable part of modern data analysis. It is also fun and nifty. It will extend your understanding of data analysis methods, allowing you to ask "What if?" and try methods out under various circumstances. In today's demo, you will test-drive a statistical computing environment called "R". 

### Learning objectives

- Use vectors and dataframes in R. 
- Encapsulate R code using functions.
- Test your functions.
- Use the R package ggplot2 to display data.

### Exercises

1. Go to [rstudio.cloud](https://rstudio.cloud/plans/free) and sign up for an account. Start a new project in Rstudio. Or, if you have R installed on your computer already, you can use that instead.
2. Solve the [classic "FizzBuzz" exercise](https://imranontech.com/2007/01/24/using-fizzbuzz-to-find-developers-who-grok-coding/) in R. You must write an R function that outputs the numbers from 1 to N. But, for each number divisible by 3, it should print "Fizz" instead of the number, and for each number divisible by 5, it should print "Buzz" instead of the number, and for numbers divisible by both 3 and 5, it should print "FizzBuzz" instead of the number. To do this, you'll need to learn some core features of R. Here's two approaches. 
    - For a systematic introduction to R oriented towards statistical uses, check out [Roger Peng's intro to R programming for data science](https://bookdown.org/rdpeng/rprogdatascience/). For today, focus on chapters 4, 13, and 14. 
    - Another nice intro is [here](https://masterr.org/rfp/). It is less comprehensive but quicker to read. It gives an interesting perspective more oriented towards programming languages.
    - If you're impatient to get started, or if you have prior coding experience, just start trying things and use google to solve problems. For example, search "if-then statements in R" or "defining functions in R". 
3. After you have a working or partly working solution:
    - Write out diverse test cases by hand. Check to make sure they are ok. If not, goto 2. 
    - Compare your solution to another person's solution. Choose it from [here](https://towardsdatascience.com/how-to-solve-the-fizzbuzz-problem-in-r-c62e7e6c959a) or [here](https://rosettacode.org/wiki/FizzBuzz#R). 
4. (Optional) For the output of `FizzBuzz(1000)`, paste it all together. Count up how many times each character appears. If you are running low on time, skip this and read Eric's results using this command.

        character_frequencies = read.csv("some/url/not/ready/yet.csv")

5. Using the R package `ggplot2`, make a scatterplot displaying the character frequencies. Save the chart as a PDF or PNG. You can use this helpful [cookbook](http://www.cookbook-r.com/Graphs/Scatterplots_(ggplot2)/) to get started. 

Email your chart and your R code to Eric as `LAST_FIRST_letter_counts.png` and `LAST_FIRST_fizzbuzz.R`. 

### Homework

- Read [this post](https://www.tomdalling.com/blog/software-design/fizzbuzz-in-too-much-detail/) about FizzBuzz design choices. 
- Browse through the collection of charts [here](https://rkabacoff.github.io/datavis/Bivariate.html). Take a look at their names and ask yourself which types of comparison or analysis each chart is useful for. 
- Do Exercise 4 if you didn't do it yet and if you still want to. 
