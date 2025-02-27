% exercises du TP3 

%exo 1 

declare
fun {Sum N}
if N == 1 then 1
else N*N + {Sum N-1} end
end

% langage noyau

declare
proc {Sum R N}
    if  N == 1 then R=1
    else
        local RE in  
        {Sum RE N-1 }
        R=N*N +RE
end

declare 
fun {SumAux N Acc}
    if N == 1 then Acc + 1
    else {SumAux N-1 N*N+Acc}
    end 
end 

% langage noyau

declare 
proc {SumAux R N Acc}
    if N==1 then Acc=Acc+1
    else R= {SumAux R N-1 N*N+Acc}  
    end 
end 