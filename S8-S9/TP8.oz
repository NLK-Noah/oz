 %2
local X Y Z in
 thread if X==1 then Y=2 else Z=2 end end
 thread if Y==1 then X=1 else Z=2 end end
 X=1
 {Browse X} %1
 {Browse Y} %2
 {Browse Z} %2
end

local X Y Z in
    thread if X==1 then Y=2 else Z=2 end end
    thread if Y==1 then X=1 else Z=2 end end
    X=2
    {Browse X} %2
    {Browse Y} %_
    {Browse Z} %2
end

%exo 3 
declare 
C= {NewCell 0}
fun {ProduceInts N}
        if @C == N then nil
        else 
            C:= @C +1
            @C|{ProduceInts N}
        end         
end

declare
C = {NewCell 0}
fun {Sum Str}
    case Str of nil then @C 
    [] H|T then
        C := @C + H
        {Sum T}
    end    
end 

local 
    Xs = {ProduceInts 666}
    S = {Sum Xs}
in
{Browse S} 
end 

declare Xs S 
thread Xs = {ProduceInts 666} end 
thread S = {Sum Xs} end 
{Browse S}
% Donnes la meme chose 

%666 thread 
%1332 pour la voie normal 


    
