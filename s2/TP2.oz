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
{Browse {Drop [r [a p] h] 2}} % quel est le resultat? ça renvoit [h]
end


declare


fun {Prefix L1 L2}
    case L1 of 
        nil then true
    [] H1|T1 then 
        case L2 of 
            nil then false
        [] H2|T2 then 
            if H1 == H2 then {Prefix T1 T2}
            else false  
            end 
        end  
    end
end  

    

fun {FindString S T I}
    case T of 
        nil then nil 
    [] H|T1 then
        if {Prefix S T} then 
            I | {FindString S T1 I+1}  
        else
            {FindString S T1 I+1}  
        end 
    end
end

{Browse {FindString [a b a b] [a b a b a b] 1}}  % Affiche [1 3]

{Browse {FindString [a] [a b a b a b] 1}} % Show [1 3 5]
{Browse {FindString [c] [a b a b a b] 1}} % Show nil



%exo 10

declare 
fun {Promenade BT}
   case BT of empty then nil
   [] btree(X left: L right: R) then
        %{Browse result( BT {Promenade L} {Promenade R})}
      X|{Promenade L}|{Promenade R}
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

%exo 13 

declare
fun{Applique L F }
    case L of nil then nil 
    []H|T then 
        { F H} | {Applique T F}
    end
end 

fun {Lol X} lol(X) end
{Browse {Applique [1 2 3] Lol}} % Affiche [lol(1) lol(2) lol(3)]
fun {Square X } X*X end 
{Browse {Applique [1 2 3] Square}}


declare
fun{MakeAdder N}
    fun {$X} N+X end 
end 
Add5 = {MakeAdder 5}
{Browse {Add5 13}} % Affiche 18

declare
Add2 = {MakeAdder 2}
fun{AddAll L N}
    {Applique L Add2}
end 
{Browse {AddAll [1 2 3] 2}}

%exo 14

{Browse {Label a#b#c}} % affiche '#'
{Browse {Width un#tres#long#tuple#tres#tres#long}} % affiche la longuer donc 5
{Browse {Arity 1#4#16}} % afficehe la liste [1 2 3]

fun {SameLength Xs Ys}
    case Xs#Ys % le cas ou ou le tuple entre Xs er Ys est nul on renvoit tur 
    of nil#nil then true
    [] (X|Xr)#(Y|Yr) then {SameLength Xr Yr} % Sinon on on avance encore dans les différents listes 
        % et on rapelle la samelength avec la tail de chaque liste et renvoit false
    else false
    end
    end
    4