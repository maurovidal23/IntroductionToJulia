#=
FUNCTIONS

Topics:

1.How to declare a function
2.Duck-typing in Julia
3.Mutating vs. non-mutating functions
4.Some higher order functions
=#

#HOW TO DECLARE A FUNCTION

#EXAMPLE: DECLARATED

function sayhi(name)
    println("Hi $name, it's great to see you!")
end

function f(x)
    x^2
end

sayhi("C-3PO")
f(42)

#DECLARACIONES DE FUNCIONES DIFERENTES

sayhi2(name)= println("Hi $name, it's great to see you!")
f2(x)=x^2

sayhi2("R2D2")
f(42)

#=DECLARACIONES DE FUNCIONES DIFERENTES:
Parecido a sentencias de lenguaje funcional
en javascript
=#

sayhi3= name -> println("Hi $name, it´s great to see you!")
f3= x->x^2

sayhi3("Chewbacca")
f3(42)

#DUCK-TYPING IN JULIA

#=Como las funciones no estan tipadas
las variables de entrada pueden ser 
distintos tipos para una misma función=#

sayhi(555)

A=rand(3,3)
A
f(A)

f("hi")

#= Podemos ver que la función f no esta 
bien definida sobre los vectores, en cambio
en el caso anterior, para la matriz A si 
existía la operación A^2 =#

v=rand(3)

#=
f(v)

ERROR: MethodError: no method matching ^(::Vector{Float64}, ::Int64)
=#

#MUTATING VS. NON-MUTATING FUNCTIONS

#= Description:

By convention, functions followed by ! 
alter their contents and functions lacking ! do not.
=#

#Diferencia entre sort y sort!

v=[3,5,2]
sort(v)
v

#=Como hemos visto la función sort ordena el vector 
pero no modifca el vector original=#

sort!(v)
v
# El uso de ! entonces se modifica el vector

#SOME HIGHER ORDER FUNCTIONS 

#=Description:
1.Map: is a "higher-order" function in Julia that takes a function as one of its 
inputs and applies that function to every element of the data structure

Syntax: 
map(f,[1,2,3]) and give you the output [f(1),f(2),f(3)]
=#

#EXAMPLE:

map(f,[1,2,3])

#Se puede pasar una función anónima

map(x-> x^3,[1,2,3])

#= 2. Broadcast: is another higher-order function like map 
Syntax: broadcast(f;[1,2,3])
=#


broadcast(f, [1,2,3])

#Similar Syntax

f.([1,2,3])

#Veamos la diferencia de usar f sin el punto

f(A)

f.(A)

#=En este caso f(A) es la A*A mientras que 
cuando ejecutamos f.(A) estamos elevando 
al cuadrado cada entrada de la matriz=#

#=Veamos la equivalencia entre notaciones 
para expresionaes mas complicadas =#

broadcast(x-> x + 2 * f(x)/x,A)

A.+2 .* f.(A) ./A

#EXERCISES

#=6.1
Write a function add_one that adds 1 to its input.
=#

add= x-> x+1
add(1)

function add2(value)
    value+1
end

#=6.2
Use map or broadcast to increment every element of matrix A
by 1 and assign it to a variable A1.
=#

A1=map(x->x+1,A)

A1=broadcast(x->x+1,A)

#=6.3
Use the broadcast dot syntax to increment every element 
of matrix A1 by 1 and store it in variable A2 =#

A2=A1.+1