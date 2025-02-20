% Ordered binary trees

declare
T=tree(key:chien value:dog
       tree(key:chat value:cat
	    tree(key:babouin value:baboon leaf leaf)
	    tree(key:chenille value:caterpillar leaf leaf))
       tree(key:singe value:ape leaf leaf))
{Browse T}

% Faire une recherche: Lookup
declare
fun {Lookup X T}
   case T of
      tree(key:K value:V Left Right) andthen X==K then
      found(V)
   [] tree(key:K value:V Left Right) andthen X<K then
      {Lookup X Left}
   [] tree(key:K value:V Left Right) andthen X>K then
      {Lookup X Right}
   [] leaf then
      notfound
   end
end

{Browse {Lookup souris T}}
{Browse {Lookup elephant T}}

% Inserer une nouvelle traduction
declare
fun {Insert X V T}
   case T of
      tree(key:K value:W Left Right) andthen X==K then
      tree(key:K value:V Left Right)
   [] tree(key:K value:W Left Right) andthen X<K then
      tree(key:K value:W {Insert X V Left} Right)
   [] tree(key:K value:W Left Right) andthen X>K then
      tree(key:K value:W Left {Insert X V Right})
   [] leaf then
      tree(key:X value:V leaf leaf)
   end
end

declare
T2={Insert ornithorinque platypus T}
{Browse T2}

% Enlever un element de l'arbre
declare
fun {RemoveSmallest T}
   case T of
      tree(key:K value:W Left Right) then
      case {RemoveSmallest Left} of
	 Yp#Wp#Tp then
	 Yp#Wp#tree(key:K value:W Tp Right)
      [] none then
	 K#W#Right
      end
   [] leaf then
      none
   end
end

declare
fun {Delete X T}
   case T of
      tree(key:K value:W Left Right) andthen X==K then
      case {RemoveSmallest Right}
      of Yp#Wp#Right2 then
	 tree(key:Yp value:Wp Left Right2)
      [] none then
	 Left
      end
   [] tree(key:K value:W Left Right) andthen X<K then
      tree(key:K value:W {Delete X Left} Right)
   [] tree(key:K value:W Left Right) andthen X>K then
      tree(key:K value:W Left {Delete X Right})
   [] leaf then
      leaf
   end
end

% Question
declare A in
A={Delete dog
   {Insert mouse souris
    {Insert cat chat
     {Insert dog chien leaf}}}}
{Browse A}
% Affiche:
% tree(key:mouse value:souris tree(key:cat value:chat leaf leaf) leaf)