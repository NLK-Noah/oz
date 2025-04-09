fun {Reverse Xs}
    fun {ReverseAux Xs Ys}
        case Xs of nil then 
            Ys
        [] X|Xr then 
            {ReverseAux Xr X|Ys}
        end
    end
    in
    {ReverseAux Xs nil}
    end



declare Ys
fun {Reverse Xs}
    Ys = {NewCell nil}
    fun {ReverseAux Xs }
        case Xs of nil then 
            @Ys
        [] X|Xr then 
            local B in
                B = X|@Ys
                Ys:=B
                {ReverseAux Xr}
            end
        end
    end
    in
        {ReverseAux Xs}   
    end
local Xs in
    Xs = 1|2|nil
    {Browse {Reverse Xs}}
end




fun{NewStack} nil end
fun{Push S X} X|S end
fun{Pop S X} X=S.1 S.2  end
fun{IsEmpty S} S==nil end

Local Eval S Z in
    Z={NewStack}
    fun{Eval S Z}
        case S of nil then {Pop Z X}
        []'+' then S1 = {Pop Z A}
                   S2 = {Pop S1 B}
                   C = A + B
                   {Eval S.2 {Push S2 C}}

        []'-' then Push{{{Pop Z} - {Pop Z}} Z} 
        []'*' then Push{{{Pop Z} * {Pop Z}} Z}
        else H|T then {Eval T {Push Z H}}     
    end
end
Z = [58 106]

local Eval S Z in 
    Z = {NewStack}
    fun { Eval S}
        case S of nil then {Z.pop}
        []'+'then local A B in 
            A = {A.pop}
            B = {B.pop}
            {Z.puhs A+B}
            {Eval S.2}
        else {Z.push S.1}
            {Eval S.2}


fun{NewStack}
    A={NewCell nil}
    fun{IsEmpty} @A == nil end 
    fun{Push X} A:= X|@A end 
    fun{Pop}
        if{IsEmpty} then nil
        else local x in 
            x =A.1
            A:=A.2
            x 
        end
    end
end
in stack(IsEmpty:IsEmpty push:push pop:pop)
end 


{Browse {Eval [13 45 '+' 89 17 '+' '*']}} % affiche 4176 = (13+45)*(89-17)
{Browse {Eval [13 45 '+' 89 '*' 17 '-']}} % affiche 5145 = ((13+45)*89)-17
{Browse {Eval [13 45 89 17 '-' '+' '*']}} % affiche 1521 = 13*(45+(89-17))

