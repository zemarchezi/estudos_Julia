using Plots, LinearAlgebra

x = 3;
a = range(-2,2,step=0.25) |> collect;
# a = reshape(a,1);
b = x*a + rand((length(a)));
