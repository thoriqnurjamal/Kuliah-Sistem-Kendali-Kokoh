pkg load control

m = 3; %nilai nominal m (massa)
c = 1; %nilai nominal c (konstanta peredam)
k = 2; %nilai nominal k (konstanta pegas)
pm = 0.4; %ketidakpastian parameter m (40% uncertainty)
pc = 0.2; %ketidakpastian parameter c (20% uncertainty)
pk = 0.3; %ketidakpastian parameter k (30% uncertainty)
%input/output dinamik (Gmds)

A=[0 1; -k/m -c/m ];
B1 = [0 0 0;-pm -pc/m -pk/m];
B2 = [0;1/m];
C1 = [-k/m -c/m; 0 c; k 0];
C2 = [1 0];
D11 = [-pm -pc/m -pk/m; 0 0 0; 0 0 0];
D12 = [1/m; 0; 0];
D21 = [0 0 0];
D22 = 0;
G = ss(A,[B1,B2],[C1;C2],[D11 D12;D21 D22])