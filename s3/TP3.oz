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
local Res in % Declaration de variable Res vide
    local Arg1 Arg2 in  % Declaration de varibles Arg1 Arg2 vide 
        Arg1=7 % Arg1 prends en valeur 7
        Arg2=6 % Arg2 prends en valeur 6
        Res=Arg1 * Arg2 % Res prends en valeur la multiplication de Arg1 et Arg2 6*7 =42
    end 
    {Browse Res} % affiche 42
end

% programme 2 
local Res in % Declaration de variable Res vide
    local Arg1 Arg2 in % Declaration de varibles Arg1 Arg2 vide 
        Arg1 = 7 %1 % Arg1 prends en valeur 7
        Res = Arg1* Arg2 %3 % Res prends en valeur la multiplication de Arg1 et Arg2 vide*7 =vide
        Arg2=6 %2 % Arg2 prends en valeur 6
    end 
    {Browse Res}% devrait afficher vide mais si on retourne ça fait 42
end 
