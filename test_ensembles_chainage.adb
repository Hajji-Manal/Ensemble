with Ensembles_Chainage;
with Ada.TEXT_IO;	use Ada.TEXT_IO;
--Programme de test du module Ensembles_Chainage.
procedure Test_Ensembles_Chainage is

    package Ensemble_Caractere is
	new Ensembles_Chainage (T_Element => Character);
    use Ensemble_Caractere;

    procedure operation( a : IN out Character) is    
    begin
	    Put("          "&Character'Image(a));
    end operation;

    procedure Afficher is new Ensemble_Caractere.Appliquer_Sur_Tous(operation);    

    --Initialiser un ensemble avec les caracteres du nom HAJJI
    procedure Initialiser_nom is
	Ens: Ensemble;
    begin
	Initialiser(Ens);
	Ajouter('I',Ens);
	Ajouter('J',Ens);
	Ajouter('J',Ens);
	Ajouter('A',Ens);
	Ajouter('H',Ens);
	Afficher(Ens);
	New_Line;
	Detruire(Ens);
    end Initialiser_nom;

    --Tester si un ensemble est vide
    procedure Tester_Est_Vide is
	Ens1, Ens2 : Ensemble;
    begin
	Initialiser(Ens1);
	Ajouter('A',Ens1);
	Supprimer('A',Ens1);
	pragma Assert(Est_vide(Ens1));
	Initialiser(Ens2);
	Ajouter('A',Ens2);
	pragma Assert(not Est_vide(Ens2));
	Afficher(Ens1);
	New_Line;
	Afficher(Ens2);
	New_Line;
	Detruire(Ens1);
	Detruire(Ens2);
    end Tester_Est_Vide;

    --tester si un élément est présent après son ajout ou sa suppression de l'ensemble.
    procedure Tester_Est_present is
	Ens: Ensemble;
    begin
	Initialiser(Ens);
	Ajouter('A',Ens);
	Ajouter('C',Ens);
	pragma Assert(Est_present(Ens,'A'));
	pragma Assert(Est_present(Ens,'C'));
        pragma Assert(not Est_present(Ens,'B'));
	Supprimer('C',Ens);
        pragma Assert(not Est_present(Ens,'C'));
	Detruire(Ens);
    end Tester_Est_present;

    --tester la fonction Taille.
    procedure Tester_Taille is
	Ens : Ensemble;
    begin
	Ajouter('A',Ens);
	pragma Assert(Taille(Ens) = 1);
	Ajouter('B',Ens);
	pragma Assert(Taille(Ens) = 2);
        Ajouter('C',Ens);
	pragma Assert(Taille(Ens) = 3);
	Supprimer('A',Ens);
	pragma Assert(Taille(Ens) = 2);
	Detruire(Ens);
    end Tester_Taille;

begin
	Initialiser_nom;
	Tester_Est_Vide;
	Tester_Est_present;
        Tester_Taille;
end Test_Ensembles_Chainage;
