#PACKAGES

#= En Julia se pueden usar un montón de paquetes
entre ellos se puedes correr código en Python 
y R =#

#EJEMPLO: 

using Pkg 
Pkg.add("Example")

using Example

#= En ese paquete existe la siguiente función:
hello(who::String ="Hello, $who)=#

hello("it's me. I was wondering if after all these years you'd like to meet")

Pkg.add("Colors")
using Colors 

palette= distinguishable_colors(100)

rand(palette,3,3)

#EXERCISE

#=7.1
Load the Primes package (source code at https://github.com/JuliaMath/Primes.jl ).
=#
Pkg.add("Primes")
using Primes

#=7.2
Verify that you can now use the function primes to grab all prime 
numbers under 1,000,000 and store it in variable primes_list=#

primes_list=primes(1000)