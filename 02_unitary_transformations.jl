using PyPlot, LinearAlgebra

theta = Array([pi/15, -pi/9, -pi/20]);
Sigma = Diagonal([3, 1, 0.5]);

# Rotation about x axis
Rx = mapreduce(permutedims, vcat, [[1, 0, 0],
               [0, cos(theta[1]), -sin(theta[1])],
               [0, sin(theta[1]), cos(theta[1])]]);

# Rotation about y axis
Ry = mapreduce(permutedims, vcat, [[cos(theta[2]), 0, sin(theta[2])],
               [0, 1, 0],
               [-sin(theta[2]), 0, cos(theta[2])]]);

# Rotation about z axis
Rz = mapreduce(permutedims, vcat, [[cos(theta[3]), -sin(theta[3]), 0],
               [sin(theta[3]), cos(theta[3]), 0],
               [0, 0, 1]]);

# Rotate and scale
X = Rz * Ry * Rx * Sigma;


##
n = 100;
# u = LinRange(π,π,n);
u = range(0,stop=2*π,length=n);

# v = LinRange(0, π, n);
v = range(0,stop=π,length=n);
x = cos.(u) * sin.(v)';
y = sin.(u) * sin.(v)';
z = ones(n) * cos.(v)';

surf(x,y,z, rstride=4, cstride=4);
savefig("NormalSphere.png");