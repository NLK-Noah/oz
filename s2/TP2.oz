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
local 
    fun{egale XS XR}
        case XS of nil then 
            case XR of nil then true
            [] _ then false
            end 
        [] HS|TS
            case XR of nil then false 
            []HR|TR then 
                if HS=HR then 
                    {egale TS TR} 
                else 
                    false
                end 
            end 
        end 
    end 

    fun{FindString S T  Count }
        case T of nil then nil

        []H|T2
            if {egale S [H|T2] }then 
                Count |{FindString S T2 Count+1}
            else 
                {FindString S T2 Count+1}
            end 
        end 
                
    end 
in
    {Browse {FindString [a b a b] [a b a b a b] 1} % Show [1 3]
end
 
{Browse {FindString [a] [a b a b a b]}} % Show [1 3 5]
{Browse {FindString [c] [a b a b a b]}} % Show nil



%exo 10

fun {Promenade BT}
    case BT of
       empty then
          nil
       btree(X, left: L, right: R) then
          X | {Promenade L} @ {Promenade R}
    end
end
 

%% affiche [42 26 54 18 37 11]
{Browse
 {Promenade
  btree(42
   left: btree(26
    left: btree(54
     left: empty
     right: btree(18
      left: empty
      right: empty))
    right: empty)
   right: btree(37
    left: btree(11
     left: empty
     right: empty)
    right: empty))}}