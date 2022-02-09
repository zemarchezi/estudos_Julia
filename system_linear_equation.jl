α = 1;
β = 1;

f(x) = exp(x)
m = 1000;
h = 1/(m+1);
x = LinRange(0,1,m+2);
x_inner = x[2:m+1];

# Function to fill values of tridiagonal matrix
function fillmat!(A)
    for i=1:m
      A[i,i] = -2                 # Diagonal
      if i<m
        A[i,i+1] = 1              # Sup-diagonal
      end
      if i>1
        A[i,i-1] = 1              # Sub-diagonal
      end
    end
  end


  # Create Undefined Matrix and fill values
A = Matrix{Float64}(undef,m,m)
fillmat!(A)

# Create Right-hand side  
F = Array{Float64}(undef,m)  
for i=1:m
  F[i] = h^2 * f(x_inner[i])
end
F[1] = F[1] - α
F[m] = F[m] - β


u = A\F;


a = - exp(0) + α;
b = β - a - exp(1);
u_exact(x) = exp(x) + a + b*x

using Plots

plot(x,u_exact.(x),marker=8, markeralpha=0.1, label="Exact Solution",legend=:outertopright)
plot!(x,[α; u; β],marker=4, label="Numerical Solution")