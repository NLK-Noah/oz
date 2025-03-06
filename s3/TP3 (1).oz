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
% Chris: R est un argument de sortie, c'est ok mais la 'convention' oz est de 
% mettre cette argument à la fin avec le charactère '?' devant le nom de la 
% variable (Pas obliger)
% Ce charactere est purement informatif est n'est pas pris en compte 
% lors de la compilation

% Chris: en langage, noyau c'est une "statement", <s>, par ligne
% Une condition est une expression, <e>, qui renvoit une valeur
% il faut donc declarer un identificateur pour stocker cette valeur
% eg. B = (N == 1); if B then ... end
% Pareil pour les valeurs numeriques (ou autre comme les atoms), il faut assigner
% la valeur à un identificateur; eg. One = 1
% -> One = 1; B = (N == One); if B then ... end
    local B One in
    One = 1

    B= (N == One)
    if  B  then 
        local One in
            One = 1 
            R=1
        end
    else
        Local RE One B R X  in  % Chris: sucre syntaxique, en noyaux faut mettre local ... in ... end
            One = 1 
            X= N*N 
            B = N-One
            {Sum RE B}
            % Chris: une statement par ligne -> A decomposer en plusieurs lignes
            R= R +RE % Chri
            
        end
    end
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
    local One  B in
    One = 1
    B = (N==One)
        local One V in
            One = 1
            V = Acc + One
            if B  then 
                R = V 
    
            else
                local RE  B One  V in 
                    B =N*N
                    RE = B + Acc
                    V = N-One  
                    {SumAux R V RE} 
                end
            end 
        end
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

% Chris:

% The contextual environment Ec of a function (or procedure) 
% contains all the identifiers that are:
%   - used **inside** the function
%   - but declared **outside** of the function

% The environment E (not contextual) is a set of pairs (identifier->variable)
% Where the variable is a memory location (or value) in the abstract machine

% The identifiers in Ecare the identifiers inside Q 
% that are defined outside of Q = free identifiers of Q

% -> La 1ere etape est de transformer le code en langage noyau
% -> La 2eme etape est de trouver les identificateurs libres de chaque fonction
% -> Il faut montrer ensuite a comment l'environment contextuelle va evoluer a chaque step d'execution dans la stack
% -> L'environment contextuelle d'une fonction Q est note:
%    Ec={P->p} is called the contextual environment of Q avec P les identificateurs libres de Q

% Computing with **environments** (not necessary contextual)
% The abstract machine does two kinds of computations with environments
% 1. Adjunction: E 2= E1+{X -> y}
%       - Add a pair (identifier->variable) to an environment
%       - Overrides the same identifier in E1 (if it exists)
%       - Needed for local <x> in <s> end (and others)
% 2. Restriction: EC=E|{X,Y,Z}
%       - Limit identifiers in an environment to a given set
%       - Needed to calculate the contextual environment


% Chris: example:
% proc {Q A} % E0 = {Q->q0, A->a0, P->p0} <-> Ec = {P->p0} == E0|{P}
%     local One Ap1 in % E1 = {One->one1, Ap1->ap1} U E0
%        One = 1
%        Ap1 = A + One
%        {P Ap1}
%     end
% end
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

% Chris: Ce qui est attendu ici c'est de montrer les environnements changer à chaque étape
% d'exécution du code sur la stack (voir slide 104 du cours 2-3)
% Oui c'est long :(

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
