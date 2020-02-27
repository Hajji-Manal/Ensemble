--Spécification du module Ensembles_Chainage.

generic 
    type T_Element is private; --Type des éléments de l'ensemble.

package Ensembles_Chainage is

    type Ensemble is limited private;

    --Initialiser un ensemble. L'ensemble est vide.
    procedure Initialiser(Ens : out Ensemble) with 
	Post => Est_vide(Ens);

    --Détruire un ensemble: libérer les ressources qu'il utilise.
    --Il ne doit plus être utilisé sauf à être de nouveau initialisé.
    procedure Detruire(Ens: in out Ensemble);

    --Est-ce que l'ensemble est vide ?
    function Est_vide(Ens: in Ensemble) return Boolean;

    --La taille de l'ensemble.
    function Taille(Ens: in Ensemble) return Integer;
            
    --Est-ce que l'élément est présent dans l'ensemble ?
     function Est_present(Ens: in Ensemble ; Element: in T_Element) return Boolean;

     --Ajouter un élément dans un ensemble.
     procedure Ajouter(Element: in T_Element ; Ens: in out Ensemble) with
	 Post => Est_present(Ens,Element);
     
     --Supprimer un élément d'un ensemble .
     procedure Supprimer(Element: in T_Element ; Ens: in out Ensemble) with
	 Pre => Est_present(Ens, Element), Post => Not Est_present(Ens, Element);
     
     --Afficher les éléments de l'ensemble.
     generic
         with procedure operation (Element: in out T_Element);
     procedure Appliquer_Sur_Tous(Ens : in Ensemble);

private

	type T_Cellule;

	type Ensemble is access T_Cellule;

	type T_Cellule is
		record
			Element: T_Element;
			Suivant: Ensemble;
		end record;


end Ensembles_Chainage;
