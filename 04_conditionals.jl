#CONDITIONALS

#=
Syntax:
with the if keyword
In Julia, the syntax

if *condition 1*
    *option 1*
elseif *condition 2*
    *option 2*
else
    *option 3*
end
allows us to conditionally evaluate one of our options.
=#

#Example: FizzBuzz

N=15
if(N%3==0)&&(N%5==0)
    println("FizzBuzz")
elseif N%3==0
    println("Fizz")
elseif N%5==0
    println("Buzz")
else
    println(N)
end

#TERNARY OPERATORS

#=
Syntax:
a ? b : c
=#

#Usual if

x=10
y=30

if x>y
    x
else
    y 
end

#Ternary operator -_> necesario mantener los espacios
(x > y) ? x : y

#WIDTH SHORT-CIRCUIT EVALUATION 

#=
Syntax: a&&b
Description: la idea es que si el primero es falso entonces no
se evalúa el segundo valor b. 
=#

false && (println("hi"); true)

true && (println("ha"); true)

#=
No es necesario que la segunda expresión 
este evaluado o no a false/true para que 
se ejecute
=#

(x > 0) && error("x cannot be greater than 0")

# veamos el operador OR ||

#=
Podemos ver que si la primera evaluación es true 
entonces devuelve true sin ver el valor de 
la segunda sentencia
=#
true || println("hi")
false || println("ha")

#EXERCISES

#=5.1
Write a conditional statement that prints a number if the number is even and the string "odd" if the number is odd.
=#
i=12

if i%2==0
    println(i)
else 
    println("odd")
end

#=
5.2
Rewrite the code from 5.1 using a ternary operator
=#

(i%2==0) ? println(i) : println("odd") 
