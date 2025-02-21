% exos 5
local Take Xs N in 
    fun{Take Xs N}
        if  N == 0 then nil else
            case Xs of nil then nil
                [] H|T then H|{Take T N-1} 
            end 
        end
    end 
{Browse {Take [r a p h] 2}} % affiche [r a]
{Browse {Take [r a p h] 7}} % aff iche [r a p h]
{Browse {Take [r [a p] h] 2}} % quel est le resultat?
end

local Drop in 
    fun {Drop Xs N} 
        if N == 0 then Xs else
	       case Xs of nil then nil
	           [] H|T then {Drop T (N-1)}
	       end 
        end 

    end 

{Browse {Drop [r a p h] 2}} % Résultat attendu : [p h]

{Browse {Drop [r a p h] 7}} % affiche nil
{Browse {Drop [r [a p] h] 2}} % quel est le resultat?
end


% exo 8 
local FindString S T  Count L C in 
    L = nil 
    Count = 0 
    C = 0
    fun{FindString S T Count}
        case T of nil then L 
            []_|T2 then 
                if {list.prefix S T} then
                    Count | {FindString S T2 Count+1}
                else 
                    {FindString S T2 Count+1}
                end 
            end 
        end
    end 
{Browse {FindString [a b a b] [a b a b a b]}} % affiche [1 3]
end 
{Browse {FindString [a] [a b a b a b]}} % affiche [1 3 5]
{Browse {FindString [c] [a b a b a b]}} % affiche nil



%exo 10