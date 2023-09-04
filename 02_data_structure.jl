#DATA STRUCTURES 

#= Types of data structures covered:
1.- Tuples
2.- Dictionaries
3.-Arrays
=#

#=TUPLES:
Description:
Inmutable Arrays

Syntax: 
(item1,item2,....)

=#

myFavouriteAnimals=("penguins", "cats", "sugarliders")

#to access to a index on the tuples
myFavouriteAnimals[1]

#= We cannot mutate value of position of a tuple:
myFavouriteAnimals[1]="otters"

ERROR: MethodError: no method matching setindex!(::Tuple{String, String, String}, ::String, ::Int64)
Stacktrace:
=#

#=For 1.6 version and new version we have NamedTuples

Description:
As you might guess, NamedTuples are just like Tuples except that each element additionally has a name!

Syntax:
(name1=item1,name2=item2,...)
=#


myfavoriteanimals = (bird = "penguins", mammal = "cats", marsupial = "sugargliders")

myfavoriteanimals[1]

#También se puede acceder por la clave al valor

myfavoriteanimals.bird

#DICTIONARIES 

#= Description:
If we have sets of data related to one another, 
we may choose to store that data in a dictionary.
We can create a dictionary using the Dict() function, 
which we can initialize as an empty dictionary or one storing key, 
value pairs.

Syntax:
Dict(key1=>value1, key2=>value2,...)
=#

myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

#=Esto es un objeto clave->valor, por lo tanto podemos acceder
al valor de un objeto podemos usar la clave
=#

myphonebook["Jenny"]

#Podemos crear nuevos elementos dentro del diccionario

myphonebook["Kramer"]="555-FILK"

#=Podemos borrar un elemento por su clave al 
igual que obtenemos el valor de esa clave
=#

Kramer_plate=pop!(myphonebook,"Kramer")
println(Kramer_plate)
myphonebook

#=Los diccionarios a diferencia de otros tipos de datos
no están ordenados por lo tanto no podemos acceder a los 
valores por índice =#

#=
myphonebook[1]

Errror: 
ERROR: KeyError: key 1 not found
Stacktrace:
 [1] getindex(h::Dict{String, String}, key::Int64)
   @ Base .\dict.jl:484
 [2] top-level scope
   @ c:\Users\mauro\Escritorio\DEVELOPER\JULIA\INTRODUCTION TO JULIA(FOR PROGRAMMERS)\02_data_structure.jl:85
=#

#ARRAYS 

#= 
Description: Mutable and ordered
Syntax: [item1,item2,...]
=#

myfriends=["Ted", "Robyn", "Barney", "Lily", "Marshall"]

#=
The 1 -> Array{String,1} significa que es un vector de dimensión 1 con las entradas de tipo String
The 2-> Array{String,2} significa que tenemos una matriz de 2 dimensiones.
etc.
=#

fibonacci=[1,1,2,3,5,8,13]

#Existen array de tipo "any" donde podemos mezclar tipos
mixture=[1,1,2,3,"Ted","Robyn"]

#=Como el array es una estructura ordenada podemos acceder a los valores 
por el índice del elemento, pero hay que recordar que en Array 
en Julia son 1-index :)
=#

myfriends[3]

#Podemos editar por el valor por el índice
myfriends[3]="Baby Bop"

#=Podemos editar el Array añadiendo elementos con la función push!()
y borrar elementos con la función pop!() que además nos retorna
el valor borrado=#

push!(fibonacci,21)
delFibonacci=pop!(fibonacci)
println(delFibonacci)
fibonacci

#Pongamos ejemplos de Array de mayor dimensión

favorites= [["koobideh","chocolate","eggs"],["penguins","cats","sugarliders"]]

#Podemos poner también ejemplos de array en más dimensiones con valores random

rand(4,3)
rand(4,3,2)

#=Tenemos que tener cuidado cuando asignamos un array a otros
arrays ya que funciona como C con punteros, es decir,
cuandoa asignamos un array a otro estamos haciendo que 
apunte un puntero al otro array al final se borra uno de los 
elementos 
=#

fibonacci
somenumbers=fibonacci
somenumbers[1]=404
fibonacci
#=El array fibonacci se modificó ya que el puntero pasó 
a apuntar el otro array, con lo cúal tenemos 2 punteros
es decir, dos nombres de avariables apuntando al mismo 
elemento=#

fibonacci[1]=1
fibonacci
somenumbers

#=Veamos como tenemos que proceder si queremos hacer una
copia de un array=#

#fibonacci en este momento esta igual que cuando lo definimos

somenumbers=copy(fibonacci)
somenumbers[1]=404
fibonacci

#EXERCISES 

#=
3.1 
Create an array, a_ray, with the following code:

a_ray = [1, 2, 3]
Add the number 4 to the end of this array and then remove it.
=#

a_ray=[1,2,3]
push!(a_ray,4)
a_ray

#=
3.2
Try to add "Emergency" as key to myphonebook with the value string(911) with the following code

myphonebook["Emergency"] = 911
Why doesn't this work?

ERROR: MethodError: Cannot `convert` an object of type Int64 to an object of type String

Closest candidates are:
  convert(::Type{String}, ::String)
   @ Base essentials.jl:298
  convert(::Type{T}, ::T) where T<:AbstractString
   @ Base strings\basic.jl:231
  convert(::Type{T}, ::AbstractString) where T<:AbstractString
   @ Base strings\basic.jl:232

Como habiamos definido el array de tipo String no podemos introducir un valor string
=#

#=
3.3
Create a new dictionary called flexible_phonebook that has Jenny's number stored as an integer and Ghostbusters' number stored as a string with the following code

flexible_phonebook = Dict("Jenny" => 8675309, "Ghostbusters" => "555-2368")
=#
flexible_phonebook=Dict("Jenny"=>8675309, "Ghostbusters"=>"555-2368")

#=
3.4
Add the key "Emergency" with the value 911 (an integer) to flexible_phonebook.
=#
flexible_phonebook["Emergency"]=911

#=3.5

Why can we add an integer as a value to flexible_phonebook but not myphonebook? 
How could we have initialized myphonebook so that it would accept integers as values? 
=#

myphonebook2=Dict("Pepe"=>111,"Juan"=>"Pepe")
myphonebook2["Emergency"]=911
myphonebook2["Juan"]="876"
