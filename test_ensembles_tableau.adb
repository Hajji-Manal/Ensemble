with Ensembles_Tableau;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Ensembles_Tableau is

    package Ensembles_8 is
       new Ensembles_Tableau (Capacite => 8, T_Element => Integer);
    use Ensembles_8;
   
    procedure Afficher_Element(n : in out  Integer) is 
    begin
        Put("          "&Integer'Image(n));
    end Afficher_Element;

    procedure paire ( n : in out Integer) is  --procedure qui passe à l'entier suivant de n si n est impaire.
    begin
	if n mod 2 = 1 then
           n := n+1;
        else
	    Null;
	end if;
    end paire;

    procedure impaire ( n : in out Integer) is --procedure passe à l'entier suivant de n si n est paire.
    begin
	if n mod 2 = 0 then
	    n:= n+1;
	else 
	    Null;
	end if;
    end impaire;

    procedure Ensemble_paire is new Ensembles_8.Appliquer_Sur_Tous(operation => paire);

    procedure Ensemble_impaire is new Ensembles_8.Appliquer_Sur_Tous(operation => impaire);
    
    procedure Afficher is new Ensembles_8.Appliquer_Sur_Tous(operation => Afficher_Element);
 
    --Avoir un ensemble qui contient que des entiers paires.
    procedure Tester_Est_Paire is
      Ensemble : T_Ensemble;
    begin
       --créer un ensemble vide Ensemble
       Initialiser(Ensemble);
       --vérifier si vide ou non, la présence de 2, 4, 6 et 8, la taille .
       pragma Assert(Est_vide(Ensemble));
       pragma Assert(not Est_present(Ensemble,2));
       pragma Assert(not Est_present(Ensemble,4));
       pragma Assert(not Est_present(Ensemble,6));
       pragma Assert(not Est_present(Ensemble,8));
       pragma Assert(taille(Ensemble) = 0);
       --Ajouter 1 , 3
       Ajouter(1,Ensemble);
       Ajouter(3,Ensemble);
       --Afficher les éléments de l'ensemble
       Afficher(Ensemble);
       New_Line;
       --vérifier si vide ou non, la la présence de 2, 4, 6 et 8,la taille.
       pragma Assert(not Est_vide(Ensemble));
       pragma Assert(not Est_present(Ensemble,2));
       pragma Assert(not Est_present(Ensemble,4));
       pragma Assert(not Est_present(Ensemble,6));
       pragma Assert(not Est_present(Ensemble,8));
       pragma Assert(taille(Ensemble) = 2);
       --Appliquer paire sur tous l'ensemble
       Ensemble_paire(Ensemble);
       --vérifier si vide ou non, la présence de 2, 4, 6 et 8,la taille.
       pragma Assert(not Est_vide(Ensemble));
       pragma Assert(Est_present(Ensemble,2));
       pragma Assert(Est_present(Ensemble,4));
       pragma Assert(not Est_present(Ensemble,6));
       pragma Assert(not Est_present(Ensemble,8));
       pragma Assert(taille(Ensemble) = 2);
       --Afficher les éléments de l'ensemble
       Afficher(Ensemble);
       New_Line;
       --Supprimer 2 et Ajouter 5 et 7.
       Supprimer(2,Ensemble);
       Ajouter(5,Ensemble);
       Ajouter(7,Ensemble);
       --vérifier si vide ou non, la présence de 2, 4, 6 et 8,la taille.
       pragma Assert(not Est_vide(Ensemble));
       pragma Assert(not Est_present(Ensemble,2));
       pragma Assert(Est_present(Ensemble,4));
       pragma Assert(not Est_present(Ensemble,6));
       pragma Assert(not Est_present(Ensemble,8));
       pragma Assert(taille(Ensemble) = 3);
       --Afficher les éléments de l'ensemble
       Afficher(Ensemble);
       New_Line;
       --Appliquer paire sur touls les éléments de l'ensemble 
       Ensemble_paire(Ensemble);
       --vérifier si vide ou non, la présence de 2, 4, 6 et 8,la taille.
       pragma Assert(not Est_vide(Ensemble));
       pragma Assert(not Est_present(Ensemble,2));
       pragma Assert(Est_present(Ensemble,4));
       pragma Assert(Est_present(Ensemble,6));
       pragma Assert(Est_present(Ensemble,8));
       pragma Assert(taille(Ensemble) = 3);
       --Afficher les éléments de l'ensemble
       Afficher(Ensemble);
       New_Line;
       --Ajouter 2 à l'ensemble
       Ajouter(2,Ensemble);
       --Afficher les éléments de l'ensemble.
       Afficher(Ensemble);
       New_Line;
       --Appliquer paire sur tous les éléments de l'ensemble
       Ensemble_paire(Ensemble);
       --vérifier si vide ou non, la présence de 2, 4, 6 et 8,la taille.
       pragma Assert(not Est_vide(Ensemble));
       pragma Assert(Est_present(Ensemble,2));
       pragma Assert(Est_present(Ensemble,4));
       pragma Assert(Est_present(Ensemble,6));
       pragma Assert(Est_present(Ensemble,8));
       pragma Assert(taille(Ensemble) = 4);
       --Afficher les éléments de l'ensemble.
       Afficher(Ensemble);
       New_Line;
       New_Line;
       New_Line;
    end Tester_Est_Paire;

    --Avoir des entiers qui ne contient que des entiers impaires.
    procedure Tester_Est_Impaire is
	Ensemble: T_Ensemble;
    begin 
        --créer un ensemble vide Ensemble
        Initialiser(Ensemble);
        --vérifier si vide ou non, la présence de 1, 3, 5 et 7, la taille .
        pragma Assert(Est_vide(Ensemble));
        pragma Assert(not Est_present(Ensemble,1));
        pragma Assert(not Est_present(Ensemble,3));
        pragma Assert(not Est_present(Ensemble,5));
        pragma Assert(not Est_present(Ensemble,7));
        pragma Assert(taille(Ensemble) = 0);
	--Ajouter 4 à l'ensemble
	Ajouter(4,Ensemble);
	-- Appliquer impaire sur tous les éléments de l'ensemble
	Ensemble_impaire(Ensemble);
        --vérifier si vide ou non, la présence de 1, 3, 5 et 7, la taille .
        pragma Assert(not Est_vide(Ensemble));
        pragma Assert(not Est_present(Ensemble,1));
        pragma Assert(not Est_present(Ensemble,3));
        pragma Assert(Est_present(Ensemble,5));
        pragma Assert(not Est_present(Ensemble,7));
        pragma Assert(taille(Ensemble) = 1);
        --Afficher les éléments de l'ensemble.
        Afficher(Ensemble);
	New_Line;
	--Ajouter 1 et 6 à l'ensemble
        Ajouter(1,Ensemble);
	Ajouter(6,Ensemble);
        --vérifier si vide ou non, la présence de 1, 3, 5 et 7, la taille 
	pragma Assert(not Est_vide(Ensemble));
        pragma Assert(Est_present(Ensemble,1));
        pragma Assert(not Est_present(Ensemble,3));
        pragma Assert(Est_present(Ensemble,5));
        pragma Assert(not Est_present(Ensemble,7));
        pragma Assert(taille(Ensemble) = 3);
	--Afficher les éléments de l'ensemble
        Afficher(Ensemble);
	New_Line;
	--Appliquer impaire sur tous les éléments de l'ensemble
	Ensemble_impaire(Ensemble);
        --vérifier si vide ou non, la présence de 1, 3, 5 et 7, la taille
        pragma Assert(not Est_vide(Ensemble));
        pragma Assert(Est_present(Ensemble,1));
        pragma Assert(not Est_present(Ensemble,3));
        pragma Assert(Est_present(Ensemble,5));
        pragma Assert(Est_present(Ensemble,7));
        pragma Assert(taille(Ensemble) = 3);
        --Afficher les éléments de l'ensemble.
        Afficher(Ensemble);
	New_Line;
	--Ajouter 2
	Ajouter(2,Ensemble);
	--Supprimer 5
	Supprimer(5,Ensemble);
        --vérifier si vide ou non, la présence de 1, 3, 5 et 7, la taille 
        pragma Assert(not Est_vide(Ensemble));
        pragma Assert(Est_present(Ensemble,1));
        pragma Assert(not Est_present(Ensemble,3));
        pragma Assert(not Est_present(Ensemble,5));
        pragma Assert(Est_present(Ensemble,7));
        pragma Assert(taille(Ensemble) = 3);
        --Afficher les éléments de l'ensemble
        Afficher(Ensemble);
	New_Line;
	--Appliquer impaire sur tous les éléments de l'ensemble
	Ensemble_impaire(Ensemble);
        --vérifier si vide ou non, la présence de 1, 3, 5 et 7, la taille
        pragma Assert(not Est_vide(Ensemble));
	pragma Assert(Est_present(Ensemble,1));
        pragma Assert(Est_present(Ensemble,3));
        pragma Assert(not Est_present(Ensemble,5));
        pragma Assert(Est_present(Ensemble,7));
        pragma Assert(taille(Ensemble) = 3);
	--Afficher les éléments de l'ensemble.
        Afficher(Ensemble);
	New_Line;
	--Ajouter 8
	Ajouter(8,Ensemble);
	--Appliquer impaire sur tous les éléments de l'ensemble
	Ensemble_impaire(Ensemble);
        --vérifier si vide ou non, la présence de 1, 3, 5 et 7, la taille
        pragma Assert(not Est_vide(Ensemble));
        pragma Assert(Est_present(Ensemble,1));
	pragma Assert(Est_present(Ensemble,3));
        pragma Assert(not Est_present(Ensemble,5));
        pragma Assert(Est_present(Ensemble,7));
        pragma Assert(taille(Ensemble) = 4);
        --Afficher les éléments de l'ensemble.
        Afficher(Ensemble);
    end Tester_Est_Impaire;
begin 
    Tester_Est_Paire;
    Tester_Est_Impaire;

end Test_Ensembles_Tableau;
