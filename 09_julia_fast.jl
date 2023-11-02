#JULIA IS FAST

#= Vamos a comparar el tiempo de ejecucuión de varias funciones
en diferentes lenguajes y vamos a comprobar que la velocidad 
de Julia es muy próxima a C que es considerado el lenguaje 
por excelencia para la programación técnica=#


#Función suma:

a=rand(10^7)
sum(a)

#Comparemos la función suma en varios lenguajes 
@time sum(a)

#=La función time puede meter ruido en los resultados, así que 
usaremos un paquete de julia que nos ayudará a comparar mejor
entre lenguajes=#

# using Pkg
# Pkg.add("BenchmarkTools")
# using BenchmarkTools 

#1. LENGUAJE C 

# using Libdl
C_code="""
include 
double c_sum(size_t n, double *X) {
    double s = 0.0;
    for (size_t i = 0; i < n; ++i) {
        s += X[i];
    }
    return s;
"""
const Clib=tempname() #make a temporary file 
# compile to a shared library by piping C_code to gcc
# (works only if you have gcc installed):

# open(`gcc -fPIC -O3 -msse3 -xc -shared -o $(Clib * "." * Libdl.dlext) -`, "w") do f
#     print(f, C_code) 
# end

# define a Julia function that calls the C function:
# c_sum(X::Array{Float64}) = ccall(("c_sum", Clib), Float64, (Csize_t, Ptr{Float64}), length(X), X)

# c_sum(a)
d = Dict()

#3. PYTHON´S BUILT IN sum

# using Pkg; Pkg.add("PyCall")
# using PyCall

pysum=pybuiltin("sum")
pysum(a)

pysum(a) ≈ sum(a) # \approx 

#Si necesitas consultar la documentación => ?isapprox

py_list_bench=@benchmark pysum(a)
d["Python built-in"] = minimum(py_list_bench.times) / 1e6
d
#4.PYTHON: NUMPY
#numpy es una libreria optimizada de C, pero que se puede llamar desde Python

# using Pkg; Pkg.add("Conda")
# using Conda

Conda.add("numpy")

numpy_sum=pyimport("numpy")["sum"]
py_numpy_bench=@benchmark numpy_sum(a)
numpy_sum(a)
numpy_sum(a) ≈ sum(a)
d["Python numpy"] = minimum(py_numpy_bench.times) / 1e6
d
#5.PYTHON, HAND-WRITTEN

py"""
def py_sum(A):
    s = 0.0
    for a in A:
        s += a
    return s
"""
sum_py = py"py_sum"
py_hand = @benchmark sum_py(a)

sum_py(a)
sum_py(a) ≈ sum(a)

d["Python hand-written"] = minimum(py_hand.times) / 1e6
d

#JULIA (BUILT-IN)

j_bench= @benchmark sum($a)
d["Julia built-in"] = minimum(j_bench.times) / 1e6
d

#JULIA (HAND-WRITTEN) 

function mysum(A)   
    s = 0.0 # s = zero(eltype(a))
    for a in A
        s += a
    end
    s
end

j_bench_hand = @benchmark mysum($a)
d["Julia hand-written"] = minimum(j_bench_hand.times) / 1e6
d

#8. JULIA (HAND-WRITTEN W. SIMD)


function mysum_simd(A)   
    s = 0.0 # s = zero(eltype(A))
    @simd for a in A
        s += a
    end
    s
end

j_bench_hand_simd = @benchmark mysum_simd($a)
mysum_simd(a)
d["Julia hand-written simd"] = minimum(j_bench_hand_simd.times) / 1e6
d
     
#SUMMARY => Podemos comprobar ya los tiempos de los diferentes métodos

for (key, value) in sort(collect(d), by=last)
    println(rpad(key, 25, "."), lpad(round(value; digits=1), 6, "."))
end