--Implantation du module Ensembles_Chainage.

with Ada.Unchecked_Deallocation;

package body Ensembles_Chainage is
    procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule,Ensemble);

    --Initialiser un ensemble . L'ensemble est vide.
    procedure Initialiser (Ens : out Ensemble) is
    begin
	Ens:= Null;
    end Initialiser;

    --Détruire un ensemble.
    procedure Detruire (Ens: in out Ensemble) is
    begin
	if Ens /= Null then
		Detruire (Ens.all.Suivant);
		Free (Ens);
	else
		Null;
	end if;
    end Detruire;

    --Est-ce que l'ensemble est vide ?
    function Est_Vide (Ens : in Ensemble) return Boolean is
    begin
	return Ens = Null;
    end Est_Vide;

    --La taille de l'ensemble.
    function Taille(Ens: in Ensemble) return Integer is
	taille : Integer;
	Ens1 : Ensemble;
    begin
	taille:= 0;
	Ens1:= Ens;
        while Ens1 /= Null loop
	      Ens1 := Ens1.all.Suivant;
	      taille := taille + 1;
	end loop;
	return taille;
    end Taille;

    --Est-ce que l'élément est présent dans l'ensemble ?
    function Est_present(Ens: in Ensemble ; Element: in T_Element) return Boolean is 
	courant: Ensemble;
    begin 
	courant:= Ens;
	while courant /= Null and then courant.all.Element /= Element loop
	    courant:= courant.all.Suivant;
	end loop;
	return courant /= Null;
    end Est_present;
    
    --Ajouter un élément dans un ensemble.
    procedure Ajouter(Element: in T_Element ; Ens : in out Ensemble) is
	cellule: Ensemble;
    begin
	if not Est_present(Ens,Element) then
        	cellule:= new T_Cellule;
        	cellule.all.Element:= Element;
        	cellule.all.Suivant:= Ens;
        	Ens:= Cellule;
	else 
	    Null;
	end if;
    end Ajouter;

    --Supprimer un élément d'un ensemble .
    procedure Supprimer(Element: in T_Element ; Ens: in out Ensemble) is
	   courant : Ensemble;        
    begin
	    if (Ens.all.Element = Element) then
		courant := Ens;
		Ens := Ens.all.Suivant;
		Free(courant);
	    else
		supprimer (Element, Ens.all.suivant);
	    end if;
    end Supprimer;

    --Afficher les éléments de l'ensemble.

    procedure Appliquer_Sur_Tous (Ens : in Ensemble) is
         
    begin
	 
       	 if Ens /= Null then
	     operation(Ens.all.Element);
	     Appliquer_Sur_Tous(Ens.all.Suivant);
	 else
	     Null;
	 end if;
    end Appliquer_Sur_Tous;
   

end Ensembles_Chainage;
