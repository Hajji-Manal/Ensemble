generic 
    capacite: Integer; -- Nombre maximal d'éléments qu'un ensemble peut contenir.
    type T_Element is private; --Type des éléments de l'ensemble.

package Ensembles_Tableau is

    type T_Ensemble is Limited private;

    --Initialiser un ensemble. L'ensemble est vide.
    procedure Initialiser(Ensemble : out T_Ensemble) with 
	Post => Est_vide(Ensemble);

    --Détruire un ensemble: libérer les ressources qu'il utilise.
    procedure Detruire(Ensemble: out T_Ensemble);

    --Est-ce que l'ensemble est vide ?
    function Est_vide(Ensemble: in T_Ensemble) return Boolean;

    --La taille de l'ensemble.
    function Taille(Ensemble: in T_Ensemble) return Integer;
            
    --Est-ce que l'élément est présent dans l'ensemble ?
     function Est_present(Ensemble: in T_Ensemble ; Element: in T_Element) return Boolean;

     --Ajouter un élément dans un ensemble.
     procedure Ajouter(Element: in T_Element ; Ensemble : in out T_Ensemble) with
	 Pre => Taille(Ensemble) < capacite ,
	 Post => Est_present(Ensemble,Element);
     
     --Supprimer un élément d'un ensemble .
     procedure Supprimer(Element: in T_Element ; Ensemble: in out T_Ensemble) with
	 Pre => Est_present(Ensemble, Element), Post => Not Est_present(Ensemble, Element);
     
     --Afficher les éléments de l'ensemble.
     generic
         with procedure operation (Element: in out T_Element);
     procedure Appliquer_Sur_Tous(Ensemble : in out T_Ensemble);
     

private
  
    type T_Tab_Elements is array (1..capacite) of T_Element;

    type T_Ensemble is
	 record
	     Elements : T_Tab_Elements; --les éléments de l'ensemble.
	     Taille: Integer;
	 end record;
	
end Ensembles_Tableau;
