#LOOPS

#=
Main topics:
1.-while loops 
2.-for loops 
=#

#WHILE LOOPS

#= 
Syntax:
while *condition*
    *loop body*
end
=#

#=Example:
Necesitamos indicar que la variable es: "global" o "local" a la 
hora de modficarla dentro de un bucle porque se considera
un nuevo scoope y asi se eliminan las posibilidades de 
reescribir variables=#

n=0


n = 0
while n < 10
    global n += 1
    println(n)
end
n


myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

i = 1
while  i <= length(myfriends)
    friend =  myfriends[i]
    println("Hi $friend, it's great to see you!")
    global i += 1
end
   
#FOR LOOPS

#=Syntax:
The syntax for a for loop is

for *var* in *loop iterable*
    *loop body*
end
=#

#=
Examples (implementar la misma funcionalidad
que en caso anterior pero ahora con bucles for):
=#

for n in 1:10
    println(n)
end

#Como lo haría en Java:
for n in 1:length(myfriends)
    friend=myfriends[n]
    println("Hi $friend, it's great to see you!")
end

#Pero como esto es parecido a Python tenemos que:

for friend in myfriends
    println("Hi $friend, it's great to see you!")
end

#Ejemplo de for sobre matrices

m,n=5,5
A=fill(0,(m,n))

#=Con el código anterior creo una matriz 5x5 llena de 0
a continuación la moficamos para que entrada tenga 
la suma de su posición de fila y columna=#

for j in 1:n
    for i in 1:m
        A[i,j]=i+j 
    end
end

#Podemos observar otro tipo de escritura

B=fill(0,(m,n))

for j in 1:n, i in 1:m
    B[i,j]=i+j
end

#Otra forma de redactar el bucle anterior

C=[i+j for i in 1:m, j in 1:n]

#EXERCISE
#=
4.1
Loop over integers between 1 and 100 and print their squares.
=#

for i in 1:100
    println(i^2)
end

#=
4.2
Add to the code above a bit to create a dictionary, squares that holds integers and their squares as key, value pairs such that

squares[10] == 100
=#

squares=Dict{Int,Int}()
for i in 1:100
    global squares[i]=i^2
end

#=
4.3
Use an array comprehension to create an an array squares_arr that stores the squares for all integers between 1 and 100.
=#
squares_arr=[i^2 for i in 1:100]
length(squares_arr)
sum(squares_arr)