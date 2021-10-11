G0 = tf(1,[1 -1]); %input G
num1 = [10^-7 10^-6]; %input numerator Wu
den1 = [10^-3 1];  %input denumerator Wu
Wu = tf(num1,den1); %transfer fungsi num dan den Wu
figure(1);bodemag(Wu) %memanggil gambar 1 menggunakan fungsi bodemag Wu 

%Mewakili ketidakpastian model yang bergantung pada frekuensi dengan
%bobot Wu dan ketidakpastian dinamis LTI yang tidak pasti InputUnc,
%blok desain kontrol ultidyn
InputUnc = ultidyn('InputUnc',[1 1]);
G = G0*(1+InputUnc*Wu); %input G
num2 = [0.95 1900 3800]; %input numerator untuk Wp
den2 = [1 1900 10]; %input denumerator untuk Wp
Wp = tf(num2,den2); %transfer fungsi num dan den Wp
figure(2);bodemag(Wp) %menampilkan gambar 2 menggunakan fungsi bodemag Wp

G.InputName = 'u'; % memberi nama untuk inputan G
G.OutputName = 'y1'; % memberi nama untuk outputan G
Wp.InputName = 'y'; % memberi nama untuk inputan Wp
Wp.OutputName = 'e'; % memberi nama untuk outputan Wp

%mendefinisikan blok jumlah, dan menggunakan koneksi.
SumD = sumblk('y = y1 + d');

inputs = {'d','u'};
outputs = {'e','y'};
P = connect(G,Wp,SumD,inputs,outputs);

%menggunakan dksyn untuk merancang pengontrol K untuk sistem yang tidak pasti ini.
nmeas = 1;
ncont = 1;
[K,CLperf,dkinfo] = dksyn(P,nmeas,ncont)
CLperf.NominalValue
pole(CLperf)