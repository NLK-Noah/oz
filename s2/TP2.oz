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
{Browse {Take [r a p h] 7}} % affiche [r a p h]
{Browse {Take [r [a p] h] 2}} % quel est le resultat?
end

local Drop Xs N in 
    fun {Drop Xs N}
        if N < 0 then nil else 
            case Xs of nil then nil
                []H|T then T|{Drop H N-1}
            end 
        end 
    end 

{Browse {Drop [r a p h] 2}} % affiche [p h]
end
{Browse {Drop [r a p h] 7}} % affiche nil
{Browse {Drop [r [a p] h] 2}} % quel est le resultat?
% exo 8 




%exo 10