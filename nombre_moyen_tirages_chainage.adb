with Ensembles_Chainage;
with Alea;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

-- Le but de cette procedure est d'afficher le nombre moyen de tirages qu'il faut faire sur 100 essais
-- pour obtenir tous les nombres d'un intervalle entier min..max en utilisant le générateur aléatoire Alea.

procedure Nombre_Moyen_Tirage_Chainage is
    
    min: Constant Integer := 1;
    max: Constant Integer := 100;

    package Mon_Alea is
	new Alea(min,max); --générateur aléatoire de nombre de min à max.
    use Mon_Alea;

    package Ensembles_Entiers is
        new Ensembles_Chainage (T_Element => Integer);
    use Ensembles_Entiers;

    Ens: Ensemble;
    n_tirage: Integer; --nombre de tirages total sur 100 essais.
    n_aleatoire: Integer; --le nombre aléatoire généré par Mon Alea.

begin
   n_tirage := 0;

   loop_1 :
   for i in 1..100 loop
       --on commence par initialiser l'ensemble au début de chaque test
       Initialiser(Ens);

       loop_2 :
       loop
          --Générer un nombre aléatoire entre min et max.
          Get_Random_Number(n_aleatoire);
	  -- On ajoute le nombre aléatoire n_aleatoire dans l'ensemble.
          Ajouter(n_aleatoire,Ens);
	  n_tirage:= n_tirage + 1;  --à chaque fois on génére un nombre aléatoire, on augmente n de 1.
	                            --à la fin de chaque essai , n sera le nombre total de tirage pour
                                    --obtenir tous les nombres compris entre min et max .
	  exit loop_2 when Taille(Ens) = max-min+1 ; --On sort de la boucle dès que la taille
                                	                  --de l'ensemble soit égale à sa capacité.
       end loop loop_2;
       Detruire(Ens);

   end loop loop_1;
   n_tirage := n_tirage / 100 ; --Après 100 tests , on calcule le nombre moyen de tirages pour
                  --générer tous les entiers compris entre min et max.
   Put("Le nombre moyen de tirage sur 100 tests est" & Integer'Image(n_tirage));

end Nombre_Moyen_Tirage_Chainage;

