% Fpass: 60 Hz, Fstop: 100 Hz, Astop: 80 dB, IIR Chebyshev Type 1
G = [0.0088 0.0071 0.0045 0.0020 3.9148e-04 0.8913];
SOS = ...
[1	2	1	1	-1.9565	0.9916;
1	2	1	1	-1.9473	0.9759;
1	2	1	1	-1.9444	0.9626;
1	2	1	1	-1.9451	0.9530;
1	2	1	1	-1.9463	0.9479];

myFilter1 = CascadeFilter(5, SOS, G, "LP_Chev_I_60_100_80");

%
G = [0.006067652675785;0.003951815866469;0.001385073053567;0.015909259476769;1];
SOS = ...
[1	2	1	1	-1.9615	0.9858;
1	2	1	1	-1.9448	0.9606;
1	2	1	1	-1.9379	0.9435;
1	1	0	1	-0.9682	0];

myFilter2 = CascadeFilter(4, SOS, G, "LP_Chev_I_60_100_80");

%%
% Chev II, 30 80, 60
G = [0.160114536893115;0.089843794144509;0.015209449885727;1];
SOS = ...
[1	-1.9327	1	1	-1.9407	0.9515;
1	-1.8763	1	1	-1.8521	0.8632;
1	-1.2304	1	1	-1.7915	0.8032];

myFilter3 = CascadeFilter(3, SOS, G, "LP_Chev_II_30_80_60");

% 
G = [0.348784003887555;0.160612112804359;0.110929782529933;1];
SOS = ...
[1	-1.8921	1	1	-1.8691	0.9068;
1	-1.7292	1	1	-1.6745	0.718;
1	1	0	1	-0.7781	0];
myFilter4 = CascadeFilter(3, SOS, G, "LP_Chev_II_45_100_40");

%
G = [0.239768030512254;0.091554118260669;1];
SOS = ...
[1.0	-1.882976912445510	1	1	-1.832736869492551	0.860795264719954;
1	1	0	1	-0.816891763478661	0];
myFilter5 = CascadeFilter(2, SOS, G, "LP_Chev_II_30_95_25");

%
G = [0.212124622487161;0.045595174963254;1];
SOS = ...
[1,-1.89680793193038,1,1,-1.88075315359252,0.902642732075459;
1,-1.46517269677535,1,1,-1.71377256893507,0.738158113400727];
myFilter6 = CascadeFilter(2, SOS, G, "LP_Chev_II_30_95_40");

%
G = [0.0612497410942363;1];
SOS = ...
[1,1,0,1,-0.877500517811528,0];
myFilter7 = CascadeFilter(1, SOS, G, "LP_Chev_II_10_95_8");

%
G = [0.431960864848779;0.114267811024118;1];
SOS = ...
[1,-1.88579778351647,1,1,-1.82956954466589,0.878900432865760;
1,-1.41502236811784,1,1,-1.53700328791962,0.603847401412867];
myFilter8 = CascadeFilter(2, SOS, G, "LP_Chev_II_50_100_25");

%
G = [0.3675, 0.1865, 0.2894, 1.0];
SOS = ...
[1.0,	-1.0878,	1.0,	1.0,	-1.4104,	0.7456;
1.0,	-0.2555,	1.0,	1.0,	-1.0284,	0.3537;
1.0,	1.0,		0.0,	1.0,	-0.4212,	0.0];
myFilter9 = CascadeFilter(3, SOS, G, "LP_Chev_II_50_100_25");
