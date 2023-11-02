#BASIC LINEAR ALGEBRA IN JULIA

A=rand(1:4,3,3)
x= fill(1.0,(3,)) # fill(1.0,3)

#=Notación: A= Array{Int64,2} y x: Array{Float64, 1} 
Julia por defecto:
Vector{Type}=Array{Type,1}
Matrix{Array}=Array{Type,2}
=#

#Multiplicacion
b=A*x

#Adjunta
A'

#Transpuesta
transpose(A)

#Tranposed multiplication (en Julia podemos no usar *)

A'A

#=Solving linear systems
Ax=b se usa la función \=#

A\b

#=A\b nos da la solución por mínimos 
cuadrados si tenemos un sistema lineal sobredeterminado (una matriz "alta")=#

Atall=rand(3,2)
Atall\b 

#=y la solución de mínimos cuadrados de norma mínima si tenemos un problema
de mínimos cuadrados de rango deficiente=#

v=rand(3)
rankdef=hcat(v,v)

rankdef\b

#=Julia también nos aporta una solución por minima norma cuando 
tenemos una solución indeterminada (a "short" matrix)=#

bshort = rand(2)
Ashort = rand(2, 3)
Ashort\bshort

#THE LINEARALGEBRA LIBRARY

#=A parte de las funciones y definiciones que contamos por defecto
existe en Julia un paquete "LinearAlgebra" que nos permitirá
obtener métodos útiles en esta materias como por ejemplo las 
factorizaciones... =#

using Pkg
Pkg.add("LinearAlgebra")
using LinearAlgebra

#EXERCISES

#=10.1
Take the inner product (or "dot" product)
of a vector v with itself and assign it to variable dot_v.=#

v=[1,2,3]
dot_v=dot(v,v) #Tiene 42 métodos

#=No hay método para los ::Array{Int64,2}
w=[1 2 3]
dot(w,w)=#

#=10.2
Take the outer product of a vector v with itself and assign it to variable outer_v
=#

outer_v=kron(v,v')

#=10.3
Use LinearAlgebra.cross to compute the cross product of a vector v
with itself and assign it to variable cross_v=#

cross_v=cross(v,v)

