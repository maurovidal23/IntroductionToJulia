#MULTIPLE DISPATCH

#Polimorfismo con varias variables

#=Declaremos algunas funciones que tengan el
mismo nombre pero que trabajen con diferentes
tipos de variables=#
f(x)=x.^2
f(10)
f([1,2,3])

#PROBEMOS A ESPECIFICAR QUE TIPOS DE LOS INPUTS

foo(x::String, y::String) =println("My inputs x and y are both string!")
foo("hello", "hi!")

#=En cambio no podemos usar la misma función con inputs number
foo(3,4)=#

#Necesitamos reescribir el método con este tipo de inputs
foo(x::Int, y::Int)=println("My inputs x and y are both integers!")

foo(3,4)

#=De esta forma podemos tener una función generica
pero con varios métodos implementados=#

#Con el siguiente sentencia podemos ver cuantos métodos 
#implementados tiene una función 
methods(foo)

#Podemos usar la función: @which foo(3, 4) para visualizar
#que método se van a usar con esos inputs

#Podemos implementar una función con inputs abstractos

foo(x::Number, y::Number) =println("My inputs x and y are both numbers!")
foo(3.0,4.0)

#Podemos tener un método por defecto con inputs: any

foo(x,y)= println("I accept inputs of any type!")

v=rand(3)
foo(v,v)

#EXERCISES 

#=9.1
Extend the function foo, adding a method that takes only one input argument,
which is of type Bool, and returns "foo with one boolean!"=#

foo(x::Bool)= println("foo with one boolean!")

#=9.2
Check that the method being dispatched when you execute

foo(true)
is the one you wrote.
=#

foo(true)

