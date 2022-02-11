using Images, FileIO, ImageView, LinearAlgebra
using Plots

img_path = "/home/jose/Dropbox/Documentos/cursos_estudos/Data-DrivenScienceEngineering/DATA_PYTHON/DATA/";

img_name = "dog.jpg";
img = load(string(img_path, img_name));

X = Gray.(img);

u, s, v = svd(X);
S = Diagonal(s);

V = v';

r = 6


for r in [6, 21, 101]
    sdu = u[:,1:r];
    sds = S[1:r,1:r];
    sdv = V[1:r,:];
    Xapprox = sdu * sds * sdv;

    ImageView.imshow(Xapprox);
end

