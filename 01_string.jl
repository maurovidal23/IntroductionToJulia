#=HOW TO GET A STRING 
2 types of structures: "---" or """---""" 
=#

s1="I am a string"

s2="""I am also a string"""

#=You cannot juxtapose string literal:
"Here, we get an" "error" "because its ambigous where this string ends"
=#

"""Look, Mom, no "errors"!!!"""

#New data type => CHAR

typeof('a')

#=
You cannot declare a string type with simple '-'
it´s reserve to char data
=#

#STRING INTERPOLATION

#=
We can use the $ sign to introduce existing variables into a string
and this evaluate his value
=#         

name="Jane"
num_fingers=10
num_toes=10

println("Hello, my name is $name")

println("I have $num_fingers fingers and $num_toes toes")

#We also can applied simple function on the $, is similar to indicate that continue need
#read that part like code

println("That is $(num_fingers + num_toes) digits in all!!!")

#STRING CONCATENATION

#= Exist 2 method to concatenate strings:
1.- Use the string() function
2.- Also we can use * symbol 
=#

s3="How many cats ";
s4="is too many cats?";
😺 = 10

print(string(s3,s4))

print(string("I don´t know, but ", 😺 , " is too few."))

println(s3*s4)

#EXERCISES

#=2.1 
Create a string that says "hi" 1000 times, first with repeat and then with the exponentiation operator, which can call * under the hood. Assign it the variable hi below.
=#

s="hi"
s0="ha"
println(repeat(s,100))

println(s0^100)

#=2.2
Declare two variables

a = 3
b = 4
and use them to create two strings:

"3 + 4"
"7"
and store the results in c and d respectively
=#

a=3
b=4

c="3+4"
d="7"
println(c)
println(d)