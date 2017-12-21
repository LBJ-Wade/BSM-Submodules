Off[General::spell]

Model`Name = "TFDM";
Model`NameLaTeX ="Fermion Triplet";
Model`Authors = "M.L Sanchez-Pelaez";
Model`Date = "2016-26-07";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)


(* Global Symmetries *)
Global[[1]] = {Z[2], Z2};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1, False, 1};
Gauge[[2]]={WB, SU[2], left,        g2, True,  1};
Gauge[[3]]={G,  SU[3], color,       g3, False, 1};


(* Matter Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};

(* Extra Fermion Field *)
FermionFields[[6]] = {rd, 1, ed,  1, 1,  1, -1};
FermionFields[[7]] = {ru, 1, eu,  -1, 1,  1, -1};


ScalarFields[[1]] =  {H, 1, {Hp, H0},     1/2, 2,  1, 1};
ScalarFields[[2]] =  {S, 1, ss,     0, 1,  1, -1};
RealScalars = {S};


        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= 
{
	{LagHC,    {AddHC->True}},
	{LagNoHC,  {AddHC->False}}
};


LagNoHC = -( mu2 conj[H].H + Lambda1/2 conj[H].H.conj[H].H + MS2/2 S.S + LamSH S.S.conj[H].H + LamS/2 S.S.S.S );
LagHC   =  - (Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q + MSF rd.ru + Ys S.e.ru);


			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
                  	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{
    {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}}     
};
 

DEFINITION[EWSB][MatterSector]=   
{
    {{vL}, {VL, Vv}},
    {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
    {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
    {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]=
{
 Fd  -> {  DL, conj[DR]},
 Fe  -> {  EL, conj[ER]},
 Fu  -> {  UL, conj[UR]},
 Fv  -> {  VL, 0},
 Fre -> {  eu, conj[ed]}
};

DEFINITION[EWSB][GaugeES]=
{
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}
};



