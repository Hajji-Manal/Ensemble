-- Implantation du module Ensembles_Tableau.

with Ada.Text_IO; use Ada.Text_IO;

package body Ensembles_Tableau is
    
    --Initialiser un ensemble.
    
    procedure Initialiser (Ensemble : out T_Ensemble) is

    begin
	Ensemble.Taille := 0;
    end Initialiser;

    --Détruire un ensemble .

    procedure Detruire (Ensemble : out T_Ensemble) is
    begin
	Null;
    end Detruire;

    --Vérifier si un ensemble est vide ou non.

    function Est_vide (Ensemble : in T_Ensemble) return Boolean is
    begin
	return Ensemble.Taille = 0;
    end Est_vide;

    --Obtenir la taille de l'ensemble.

    function Taille (Ensemble : in T_Ensemble) return Integer is
    begin
	return Ensemble.Taille;
    end Taille ;
    

    --vérifier si un élément est présent dans l'ensemble.
    
    function Est_present ( Ensemble : in T_Ensemble ; Element : in T_Element) return Boolean is

    present: Boolean; --Booleen qui prend la valeur vrai so l'élément existe dans l'ensemble et faux dans le cas                        contraire.
    i: Integer; --Indice des éléments dans Ensemble.Elements.

    begin	
	   present := False;
	   i:= 1;
	   while not present and i <= Ensemble.Taille loop
	      if Ensemble.Elements(i) = Element then
		    present := True ;
              else 
         	i := i + 1;
              end if;
	   end loop;

	return present;
    end Est_present;

    --Ajouter un élément à un ensemble.

    procedure Ajouter (Element : in T_Element ; Ensemble : in out T_Ensemble) is
    begin
	Ensemble.Taille := Ensemble.Taille + 1;
	Ensemble.Elements (Ensemble.Taille) := Element;
    end Ajouter;

    --Supprimer un élément d'un ensemble.

    procedure Supprimer (Element : in T_Element ; Ensemble : in out T_Ensemble) is
        i : Integer;	
    begin
	i:= 1;

	while i < Ensemble.Taille  and Ensemble.Elements(i) /= Element  loop
	        i := i+1;
	end loop;

	Ensemble.Elements(i) := Ensemble.Elements(Ensemble.Taille);
	Ensemble.Taille := Ensemble.Taille - 1 ;
    end Supprimer;

    -- Appliquer une opération sur tous le éléments de l'ensemble.

    procedure Appliquer_Sur_Tous (Ensemble : in out T_Ensemble) is
    begin
       for i in 1..Ensemble.Taille loop
	   operation(Ensemble.Elements(i));
       end loop;
    end Appliquer_Sur_Tous;

end Ensembles_Tableau;
