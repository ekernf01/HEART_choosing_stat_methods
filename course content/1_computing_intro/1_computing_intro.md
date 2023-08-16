## Programming

### Learning objectives

Today in class you will test-drive a programming language called "Python". The goals:

- Understand, create, and modify common Python variable types: `int`, `float`, `str`, `list`, `set`, `dict`
- Understand, create, and modify "dataframes"
- Encapsulate Python code using "functions"
- Test your functions.
- Repeatedly apply Python code using "loops" and "list comprehensions".

You may also use R for this class if you know it already but we will only be teaching Python. 

### Background

Computer programming is hugely important for modern data analysis. It is also fun and nifty. It will extend your understanding of data analysis methods, allowing you to ask "What if?" and try methods out under various circumstances. 

There are two ways to learn computer programming. You can read books or guides that take you step by step, or you can pick a goal and seek information as needed to accomplish that goal. Today's demo will go step-by-step, but may not cover everything you need. So, you have two responsibilities. 

- If you get stuck, please say something! It will help you, and me, and any classmates stuck on the same issue. 
- Realize that today's session teaches you enough to be dangerous. If you decide to pursue programming further, you need to eventually become less dangerous by spending more time learning good practices. [This](https://goodresearch.dev/) is a great resource for scientific projects.

### Resources

- [Learn Python the Hard Way](https://learnpythonthehardway.org/) is a popular and thorough introduction.
- [ChatGPT](https://openai.com/blog/chatgpt) can translate your instructions to code and can help you understand Python code. To help you learn better, even if you write the same exact lines of code given by chatGPT, I would ask that you **type them out yourself instead of using copy and paste**. You'll learn more.
- [Python for science and engineering](https://www.halvorsen.blog/documents/programming/python/resources/Python%20for%20Science%20and%20Engineering.pdf) (pdf link) spans from beginnings through heavier math and engineering topics. 

### Exercises

At the end of class, email me your Python notebook in `html` or `ipynb` file format. In the email, include a couple sentences describing how today's lesson went.

1. It's easiest to use Python within a dedicated code editor. My recommendations are Google Colaboratory (quicker startup) or Visual Studio Code (good for the long term). Go to [https://colab.research.google.com/](https://colab.research.google.com/) and create a new notebook. 
2. Create a variable `my_integer` storing a whole number. Check its `type` and test out arithmetic operations on it.

        my_int = 42
        print(my_int)
        print(type(my_int))
        print(my_int + 2)
        print(my_int / 5)

3. Create a variable `my_float` storing a decimal. Check its `type` and test out arithmetic operations on it. (See also: [Julia Evans](https://jvns.ca/blog/2023/01/13/examples-of-floating-point-problems/#how-does-floating-point-work) on floating point numbers).

        my_float = 3.14159
        print(my_float)
        print(type(my_float))
        print(my_float - 2)
        print(my_float * 5)

4. Create a variable `my_str` storing a word (aka a "string"). Check its `type` and test out arithmetic operations on it. 

        my_str = "banana"
        print(my_str)
        print(type(my_str))
        print(my_str * 2)
        print(my_str + " apple")
        print(my_str[0:2])
        print(my_str.split("a"))

5. Variables can be named almost anything and can contain almost any value. They are not enclosed in quotes. To express specific strings like `"banana"`, you add quotes. These are called literals and they must be taken at face value. This code won't run because it uses an undefined variable, `banana`, instead of a literal, `"banana"`. 

        my_str = banana 

6. Lists are the most basic container in Python, capable of storing a collection of values and retrieving them based on their distance from the start (starting at 0). 

        my_list = [42, 3.1419, "banana"]
        print(my_list)
        print(type(my_list))
        print(my_list[0])
        print(my_list[1])
        print(my_list[2])
        print(my_list * 2)
        print(my_list + my_list)

7. To repeat an operation and produce a list of results, there is a pithy, expressive idea called a "list comprehension."

        print([type(element) for element in my_list])
        print([i*i*i for i in range(10)])

8. You can also use a loop and collect the results in a new list.

        my_list_doubled = []
        for element in my_list:
            element = element*2
            my_list_doubled.append(element)
        print(my_list_doubled)

9. A `dict` is like a list, but instead of being ordered, it is named.

        example_dict = { "int": 42, "float": 3.14, "string": "banana", "list": [i for i in range(3)] }
        print(example_dict)
        print(example_dict["float"])

10. A dataframe is a rectangular array similar to an Excel sheet. Dataframes are not built into python but are implemented in third-party packages. Two of the most common implementations are "pandas" and "polars". You can make a pandas dataframe from a dict containing lists. 

        import pandas as pd
        my_df = pd.DataFrame({"make": ["honda", "toyota", "ford"], "model": ["civic", "prius", "explorer"], "mpg": [35, 50, 25]}, index = ["a", "b", "c"])
        print(my_df)

11. Accessing and modifying Pandas dataframe elements can be done using numbers (like a list) or names (like a dict).

        print(my_df.columns)
        print(my_df.iloc[0,0])
        print(my_df.loc["a", "make"])
        my_df.iloc[2,2] = -999
        print(my_df)

12. To re-use your code easily, define a function.

        def compute_standard_deviation(some_numbers):
            sum = 0
            for n in some_numbers:
                sum = sum + n
            mean = sum/len(some_numbers)
            sum_squares = 0
            for n in some_numbers:
                sum_squares = sum_squares + (n-mean)**2
            standard_deviation = sum/(len(some_numbers)-1)
            return standard_deviation
            
        print(compute_standard_deviation([1,2,3]))
        print(compute_standard_deviation([1,3,5]))
