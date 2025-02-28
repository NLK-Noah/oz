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