#PLOTTING 

# Necesitamos usar el paquete plots

using Pkg
Pkg.add("Plots")
using Plots

globaltemperatures=[14.4,14.5,14.8,15.2,15.5,15.8]
numpirates=[45000,20000,15000,5000,400,17]

#Elegimos backend
gr()

plot(numpirates,globaltemperatures,label="line",lc=:white)
scatter!(numpirates,globaltemperatures,label="points")

#=El uso de la ! es para que la función modifique la 
salida anterior =#

#=Modifiquemos el plot anterior con un label para 
las variables x e y, a la vez que le ponemos un title=#


xlabel!("Number of Pirates [Approximate]")
ylabel!("Global Temperature (C)")
title!("Influence of pirate population on global warming")

xflip!()

#AHORA PODEMOS CREAR EL MISMO PLOT CON OTRO BACKEND 

Pkg.add("UnicodePlots")
using UnicodePlots
unicodeplots()


lineplot(numpirates,globaltemperatures)

gr()


#EXERCISES

#=8.1
Given

x = -10:10
plot y vs. x for Y=X^2
. You may want to change backends back again.
=#
x=-10:10

plot(x,x)
scatter!(x,x.^ 2)

#= En la anterior ejecución necesito hacer uso del
punto antes de la operación de elevar porque x es un
Array esa función no esta definida para esa estructura
lo que quiero conseguir es que se aplique el cuadrado
a cada elemento del Array=#

#=8.2
Execute the following code=#

p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)
plot(p1, p2, p3, p4, layout = (1, 4), legend = false)