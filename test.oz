declare 
fun{SumDigit3 N}
    (N mod 10) + ((N div 10)mod 10) + ((N div 100)mod 10)
end 
{Browse {SumDigit3 500}}

