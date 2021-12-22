# Example solution to FizzBuzz in R for Eric's HEART class on principles of statistics. 

# Do it for just one number
FizzBuzzOne = function(i){
    output = ""
    if( i %% 3 == 0 ){
        output = paste0(output, "Fizz")
    }
    if( i %% 5 == 0 ){
        output = paste0(output, "Buzz")
    }
    if( nchar(output)==0 ){
        output = paste0(output, i)
    }
    output
}
# Apply it to all numbers
FizzBuzz = function(N) sapply(1:N, FizzBuzzOne)
# For exercise 4
concatenated_output = paste0(FizzBuzz(1e3), collapse = "")
character_frequencies = table(strsplit(concatenated_output, "")[[1]])
character_frequencies = setNames(as.data.frame(character_frequencies), c("Character", "Frequency"))
library(ggplot2)
ggplot(character_frequencies) + 
    geom_point(aes(x = Character, y = Frequency)) + 
    ggtitle("Character frequencies in FizzBuzz(1000)")
ggsave("example_plot1.png", width = 5, height = 5)
ggplot(character_frequencies) + 
    geom_bar(aes(x = Character, y = Frequency), stat = "identity") + 
    ggtitle("Character frequencies in FizzBuzz(1000)")
ggsave("example_plot2.png", width = 5, height = 5)
{
    png("example_plot3.png", width = 500, height = 500)
    pie(character_frequencies$Frequency, character_frequencies$Character, main = "Character frequencies in FizzBuzz(1000)")
    dev.off()
}
ggplot(character_frequencies) + 
    geom_bar(aes(x = "", y = Frequency, fill = Character), stat = "identity", position = "stack") + 
    ggtitle("Character frequencies in FizzBuzz(1000)") 
ggsave("example_plot4.png", width = 5, height = 5)

ggplot(character_frequencies) + 
    geom_bar(aes(x = "", y = Frequency, fill = Character), stat = "identity", position = "stack") + 
    ggtitle("Character frequencies in FizzBuzz(1000)") + 
    scale_fill_manual(values = rep(c("grey", "black"), length.out = 15))
ggsave("example_plot5.png", width = 5, height = 5)
