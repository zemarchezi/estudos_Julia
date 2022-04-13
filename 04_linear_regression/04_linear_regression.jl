using Plots, LinearAlgebra

x = 3;
a = range(-2,2,step=0.25) |> collect;
# a = reshape(a,1);
b = x*a + rand((length(a)));


plot(a, x*a, label="True Signal")
plot!(a, b,marker=4, label="Noisy data")

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

p1 = figure()
surf(x,y,z, rstride=4, cstride=4);
# show()
savefig("NormalSphere.png")
close(p1)


xR = zeros(size(x));
yR = zeros(size(y));
zR = zeros(size(z));

for i in 1:size(x)[1], j in 1:size(x)[2]
    vec = [x[i,j], y[i,j], z[i,j]];
    vecR = X * vec;
    xR[i,j] = vecR[1];
    yR[i,j] = vecR[2];
    zR[i,j] = vecR[3];

end

p2 = figure()
surf(xR,yR,zR, rstride=4, cstride=4);
# show()
savefig("RotatedSphere.png")
close(p2)