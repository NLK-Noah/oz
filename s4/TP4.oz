%1 4 6 7 

%Écrivez une fonction {MakeMulFilter N} qui renvoie une fonction à un argument I qui renvoie si I est une
%multiple de N
local N in 
    N=10
    fun {Mul I}
        if (I mod N) ==0 then 
            {Browse I est un multiple de N  }
        else 
            {Browse I n'est pas un multiple de N }
        end
    end
    fun {MakeMulFilter N}
        I=2
        {Mul I}
    end
    {MakeMulFilter N}
end
    