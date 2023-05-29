# Do it for just one number
def FizzBuzzOne(i):
    output = ""
    if i % 3 == 0:
        output += "Fizz"
    if i % 5 == 0:
        output += "Buzz"
    if len(output) == 0:
        output += str(i)
    return output

# Apply it to all numbers with a list comprehension
def FizzBuzz(N):
    return [FizzBuzzOne(i) for i in range(1, N+1)]

# Here's another way to do the same thing.
def FizzBuzzLoop(N):
    result = [None] * N
    for i in range(1, N+1):
        result[i-1] = FizzBuzzOne(i)
    return result

# Test cases
print(FizzBuzzOne(3))
print(FizzBuzzOne(6))
print(FizzBuzzOne(5))
print(FizzBuzzOne(10))
print(FizzBuzzOne(15))
print(FizzBuzzOne(0))
print(FizzBuzzOne(-3))
print(FizzBuzzOne(60))
print(FizzBuzz(15))

# For exercise 4
import pandas as pd

concatenated_output = ''.join(FizzBuzz(1000))
character_frequencies = pd.Series(list(concatenated_output)).value_counts().reset_index()
character_frequencies.columns = ['Character', 'Frequency']
character_frequencies.to_csv("character_frequencies.csv", index=False)

# Exercise 5
import matplotlib.pyplot as plt

character_frequencies = character_frequencies.sort_values('Character')
plt.figure()
plt.scatter(character_frequencies['Character'], character_frequencies['Frequency'])
plt.title("Character frequencies in FizzBuzz(1000)")
plt.savefig("example_plot1.png")

plt.figure()
plt.bar(character_frequencies['Character'], character_frequencies['Frequency'])
plt.title("Character frequencies in FizzBuzz(1000)")
plt.savefig("example_plot2.png")

plt.figure()
plt.pie(character_frequencies['Frequency'], labels=character_frequencies['Character'], autopct='%1.1f%%')
plt.title("Character frequencies in FizzBuzz(1000)")
plt.savefig("example_plot3.png")

plt.figure()
plt.bar(height = character_frequencies['Frequency'], x=character_frequencies['Character'])
plt.title("Character frequencies in FizzBuzz(1000)")
plt.savefig("example_plot4.png")
