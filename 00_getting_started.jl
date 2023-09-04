
#HOW TO PRINT
println("I'm excitedd to learn Julia!")

#HOW TO ASSIGN VARIABLES -> ESTRUCTURE (VARIABLE NAME=VALUE) NO TYPE LIKE PYTHON

my_answer=42
typeof(my_answer)
println(typeof(my_answer))

my_pi= 3.141592
println(typeof(my_pi))


😺 = "smiley cat!"
println(typeof(😺))

#we can rewrite a variable with a value of diferrent type
😺=1
println(typeof(😺))

#= Se puede
dejar comentarios 
en varias lineas=#

#SINTAX FOR BASIC MATH 


sum=3+7; println(sum)
diff=10-3; println(diff)
product= 20*5; println(product)
quotient= 100/10; println(quotient," ", typeof(quotient))
power= 10^2; println(power)
modulus=101%2; println(modulus)

#EXERCISES

#1.1 Look up docs for the convert function.

#=
Sintax=convert(T, x)

Description:
Convert x to a value of type T.
If T is an Integer type, an InexactError will be raised if x is not representable by T, for example if x is not integer-valued, or is outside the range supported by T.
=#

#example

convert(Int, 3.0)

#1.2 Assign 365 to a variable named days. Convert days to a float and assign it to variable days_float

days= 365
days_float=convert(Float64,days)

#1.3 See what happens when you execute

#=convert(Int64, "1")
no permite ejecutar la transformacion de tipo string a integer
=#


parse(Int64, "1") 
#Con la funcion parse si podemos modificar el tipo del dato de string a integer

#=UNSIGNED_INT (UInt) vs SIGNED_INT (Int):
Los tipos unsigned no puedes ser negativos con lo cual
si definimos un UInt4 las posibilidades para ese número son: {0,1,2....,15}.
En cambio en los signed estan permitidos los valores negativos con lo cual
para un Int4 existen las siguientes posibilidades sobre el valor que pueda
tomar la variable: {-8,-7,...,0,...,7}
=#