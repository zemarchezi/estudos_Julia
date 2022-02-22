using Plots, LinearAlgebra

theta = Array([pi/15, -pi/9, -pi/20]);
Sigma = Diagonal([3, 1, 0.5]);

# Rotation about x axis
Rx = [[1, 0, 0],
               [0, cos(theta[1]), -sin(theta[1])],
               [0, sin(theta[1]), cos(theta[1])]];

# Rotation about y axis
Ry = [[cos(theta[2]), 0, sin(theta[2])],
               [0, 1, 0],
               [-sin(theta[2]), 0, cos(theta[2])]];

# Rotation about z axis
Rz = [[cos(theta[3]), -sin(theta[3]), 0],
               [sin(theta[3]), cos(theta[3]), 0],
               [0, 0, 1]];

# Rotate and scale
X = Rz .* Ry .* Rx' .* Sigma';