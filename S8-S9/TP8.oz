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
    thread if Y==1 then X=1 else Z=2 end end %excute jaamis 
    X=2
    {Browse X} %2
    {Browse Y} %_
    {Browse Z} %2
end

%exo 3 
declare 
fun {ProduceInts N}
            fun{ProduceIntsAux N C }
                if  C ==N then nil
                else
                    C |{ProduceIntsAux N C +1}
                end 
            end
        in 
            {ProduceIntsAux N 0}
end

declare 

fun {Sum Str}
    fun {SumAux Str C }
    
        case Str of nil then C 
        [] H|T then
            {SumAux T C +H}
        end
    end
in
    {SumAux Str 0}
end



local 
    Xs = {ProduceInts 666}
    S = {Sum Xs}
in
{Browse S} 
end 

declare Xs S
Xs = {ProduceInts 666}
S = {Sum Xs}
{Browse S}

declare Xs S 
thread Xs = {ProduceInts 666} end 
thread S = {Sum Xs} end 
{Browse S}
% Donnes la meme chose 

%666 thread 
%1332 pour la voie normal 

%exo 4 

% Produteur de 10 000 entiers 
declare 
fun {ProduceInts N }
    fun {ProduceIntsAux C}
        if C == N then nil 
        else C|{ProduceIntsAux C+1}
        end 
    end
  in
        {ProduceIntsAux 0}
end 

fun {Filter Str}
    case Str of nil then nil
    [] H|T then 
        if H mod 2 == 0 then {Filter T} 
        else H|{Filter T}
        end 
    end 
end % pour n =10 1|3|5|7|9

declare 
fun{Add F}
    fun{AddAux F J}
        case F of nil then J
        []H|T then 
            {AddAux T J+H}
        end 
    end
  in
    {AddAux F 0} 
end

declare Xs F R
thread Xs = {ProduceInts 10} end 
thread F =  {Filter Xs} end
thread R = {Add F} end 
{Browse R} 


%Charlotte 
declare 
fun {Barman N}
    fun {BarmanAux C}
        if C == N then nil 
        else 
            B = {ServeBeer}
            {Delay 3000}
            B|{BarmanAux C+1}
        end 
    end
    in
    {BarmanAux 0}
end

declare
fun {Charlotte Str }
    fun{CharlotteAux Str C V }
        case Str of nil then C V 
        []Beer|T then 
            if {SmellTrappist Beer} == True then {CharlotteAux T C+1 V}
            else {CharlotteAux T C V+1}
            end 
        end
    end
    in
        {CharlotteAux Str 0 0}
end

declare Xs R 
thread Xs={Barman 10}end
thread R = {Charlotte Xs}end
{Browse R}

%exercise 5 
declare 
fun {Counter InS}
    fun {CounterAux InS Z E R seen}
        case InS of nil then nil
        [] H|T then 
            if H == a then 
                I={Label seen H}
                (U|[H#I]) | {CounterAux T Z+1 E R seen(H:Z+1)} 
            elseif H == b then 
                I={Label seen H}
                (U|[H#E+1]) | {CounterAux T Z E+1 R seen(H:E+1)} 
            else 
                I={Label seen H}
                (U|[H#R+1]) | {CounterAux T Z E R+1 seen(H:R+1)} 
            end 
        end 
    end 
in
    {CounterAux InS 0 0 0 seen()}
end 

local InS in
    InS = a|b|a|c|nil
    {Browse {Counter InS}}
end

%[a#1]|[a#1 b#1]|[a#2 b#1]|[a#2 b#1 c#1]|_