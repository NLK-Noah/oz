% exercises du TP3 

%exo 1 

declare
fun {Sum N}
if N == 1 then 1
else N*N + {Sum N-1} end
end

{Browse {Sum 5}}

% langage noyau

declare
proc {Sum R N}
    if  N == 1 then R=1
    else
        RE in  
        {Sum RE N-1 }
        R=N*N +RE
    end
end
declare R  
{Sum R 5}  
{Browse R}

declare 
fun {SumAux N Acc}
    if N == 1 then Acc + 1
    else {SumAux N-1 N*N+Acc}
    end 
end

{Browse {SumAux 5 1}}

% langage noyau

declare 
proc {SumAux R N Acc}
    if N==1 then R= Acc+1
    else
        RE in 
        RE = N*N+ Acc 
        {SumAux R N-1 RE}  
    end 
end 
declare R 
{SumAux R 5 1}
{Browse R}

fun {Sum N }
    {SumAux N 0}
end 

% langage noyau 
proc{Sum R N} 
    {SumAux R N 0}
end
declare R
{Sum R 5}
{Browse R}

%exo 2 

{Browse '|'(1 nil)} % affiche [1]
{Browse '|'(1'|'(2'|'(3 nil)))} % affiche [1 2 3]
{Browse (nil)} % affiche nil 
{Browse state(1:4 2:f 3:3)} % affiche state(4 f 3)


% exo 3 

proc {Q A} {P A+1} end  % Q est une procédure prenant A comme argument et renvoir la procedure P avec comme argument A+1 il manque un argument pour le resultat 

proc {P} {Browse A} end % P est une procédure sans arguments qui montre A mais cela marche pas car il est pas définit on aurait pu faire une local A in  et il manque un argument pour stocker le réusltat 

local P Q in % Declararion de variable P et Q
    proc {P A R} R=A+2 end % P est une procédure avec A et R qui prends le résultat et renvoit R = A+2 mais R est déclarer dans la local
    local P R in % Declaration de variable P et R
        fun {Q A } % Q est une fun qui prends A en argument
            {P A R} % appel de ma procédure P qui prends A et un argument de résultat
            R % renvoit la valeur stocker dans R 
        end 
        proc {P A R } R=A-2 end % P est une procédure qui prends A et un argument de résultat et renvoit R = A-2
    end
    {Browse {Q 4}} % appell de la function Q
end 

%ce code affichera 2 


%exo 4

%programme 1 
local Res in 
    local Arg1 Arg2 in   
        Arg1=7                %S1 ( Browse -> browse ) , (browse = (proc{$x}...end , ..), res , arg1 , arg2)
                              %S2(Res->res), browse = (proc{$x}...end , ..), res , arg1 , arg2)
                              %S3(Arg1->arg1 , Arg2 -> arg2),browse = (proc{$x}...end , ..), res , arg1 , arg2)
                              %S4(Browse -> browse , Res -> res , Arg1 -> arg1 , Arg2 -> arg2) ,browse = (proc{$x}...end , ..), res , arg1 =7 , arg2)
                              %S5 (//),browse = (proc{$x}...end , ..), res , arg1 =7 , arg2 =6 )
                              %S6(//),browse = (proc{$x}...end , ..), res =7x6 , arg1 =7 , arg2 = 6)
                              %S7(Browse -> browse  ) , (proc{$x}...end , ..), res =7x6
                              %S8 (Browse -> browse  ) , (proc{$x}...end , ..), res =7x6

        Arg2=6 
        Res=Arg1 * Arg2 
    end 
    {Browse Res} 
end

% programme 2 
local Res in 
    local Arg1 Arg2 in 
        Arg1 = 7                            %S1 ( Browse -> browse ) , (browse = (proc{$x}...end , ..), res , arg1 , arg2)
                                            %S2(Res->res), browse = (proc{$x}...end , ..), res , arg1 , arg2)
                                            %S3(Arg1->arg1 , Arg2 -> arg2),browse = (proc{$x}...end , ..), res , arg1 , arg2)
                                            %S4(Browse -> browse , Res -> res , Arg1 -> arg1 , Arg2 -> arg2) ,browse = (proc{$x}...end , ..), res , arg1 =7 , arg2)
                                            %code va bloquer car arg 2 pas défini 
        Res = Arg1* Arg2 
        Arg2=6 
    end 
    {Browse Res}
end 


%exo 5 
%S1(local MakeAdd end ),(Makeadd -> makeadd , Add1->add1 , Add2->add2 ) , (makeadd , add1 , add2)
%S2(proc end  ,Add1->add1,Add2->add2, X -> x , Add -> add) , (browse = makeadd =(proc ...),add1,add2, x , add)
%S3( //,// Y-> Z->z ) , (// y , z)
%S4(//),(//)z=x+Y
%S5(MakeAdd),(add1=proc end )
%S6(//),(add2 = proc .. end )
%S7[(//),Makeadd  ) , (x=1 , add1=proc() y=42 v=43)
local MakeAdd Add1 Add2 in
    proc {MakeAdd X Add}
        proc {Add Y Z}
        Z=X+Y
        end
    end
    {MakeAdd 1 Add1}
    {MakeAdd 2 Add2}
    local V in
    {Add1 42 V} {Browse V}
    end
    local V in
    {Add2 42 V} {Browse V}
    end
end
    
