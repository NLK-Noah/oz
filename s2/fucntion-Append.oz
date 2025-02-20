% DEVOIR  entrainement 
declare 
% fonction append 2 listes et les mettres en  1 list 
fun {Append  X Y }
    case X of nil then Y  
    [] H|T then H | {Append  T Y}
    end
end
%{Browse {Append [r a] [p h]}} % affiche [r a p h]
%{Browse {Append [b [o r]] [i s]}} % affiche [b [o r] i s]


% Kernel language 

proc{Append X Y result};
    case X  
    of nil then result=Y
    else 
        case X of H|T then 
            local T in
                T= Y
                {Append Y T result }
        end
    end 
end 
{Browse {Append nil [l u i s]}} % affiche [l u i s]
