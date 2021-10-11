pkg load control
A = [2    6    -6
     7    0     5
    -6    5     4];
B = [0     4     0     0
     1     1    -2    -2
     4     0     0    -3];
C = [-6     0     8
     0     5     0
    -2     1    -4
     4    -6    -5
     0   -15     7];
D = [0     0     0     0
     0     0     0     1
     0     0     0     0
     0     0     3     6
     8     0    -7     0];
P = ss(A,B,C,D);
pole(P)
nmeas = 2;
ncont = 1;
[K,CL,gamma] = h2syn(P,nmeas,ncont);