with Ensembles_Tableau;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Ensembles_Sujet_Tableau is
        
    -- Instancier le paquetage Ensembles_Tableau pour avoir un Ensemble
    -- d'entiers de capacité 10

        package Ensembles_Entiers_10 is
            new Ensembles_Tableau (Capacite => 10, T_Element => Integer);
        use Ensembles_Entiers_10;

    -- Définir une opération Afficher qui affiche les éléments d'un ensemble
    -- d'entier en s'appuyant sur Appliquer_Sur_Tous.  L'ensemble {5, 28, 10}
    -- sera affiché :
    --           5         28         10
	
	procedure operation( n : IN out Integer ) is 
	   
	begin
	    Put("          "&Integer'Image(n));
	end operation;
	
	procedure Afficher is new Ensembles_Entiers_10.Appliquer_Sur_Tous(operation);

	Ens1 : T_Ensemble;

begin
	-- Créer un ensemble vide Ens1
        Initialiser(Ens1);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	pragma Assert(Est_vide(Ens1));
	pragma Assert(Taille(Ens1) = 0);
	pragma Assert(not Est_present(Ens1,2));
	pragma Assert(not Est_present(Ens1,5));
        pragma Assert(not Est_present(Ens1,7));
	pragma Assert(not Est_present(Ens1,10));
	-- Ajouter 5 dans Ens1
	Ajouter(5,Ens1);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	--
	pragma Assert(not Est_vide(Ens1));
	pragma Assert(Taille(Ens1) = 1);
	pragma Assert(not Est_present(Ens1,2));
	pragma Assert( Est_present(Ens1,5));
        pragma Assert(not Est_present(Ens1,7));
	pragma Assert(not Est_present(Ens1,10));

      	-- Ajouter 28 puis 10 dans Ens1
	Ajouter(28,Ens1);
	Ajouter(10,Ens1);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not Est_vide(Ens1));
        pragma Assert(Taille(Ens1) = 3);
	pragma Assert(not Est_present(Ens1,2));
	pragma Assert(Est_present(Ens1,5));
	pragma Assert(not Est_present(Ens1,7));
	pragma Assert(Est_present(Ens1,10));
	-- Ajouter 7 dans Ens1
	Ajouter(7,Ens1);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not Est_vide(Ens1));
        pragma Assert(Taille(Ens1) = 4);
        pragma Assert(not Est_present(Ens1,2));
        pragma Assert(Est_present(Ens1,5));
        pragma Assert(Est_present(Ens1,7));
        pragma Assert(Est_present(Ens1,10));
	-- Supprimer 10 en Ens1
	Supprimer(10,Ens1);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not Est_vide(Ens1));
        pragma Assert(Taille(Ens1) = 3);
        pragma Assert(not Est_present(Ens1,2));
        pragma Assert(Est_present(Ens1,5));
        pragma Assert(Est_present(Ens1,7));
        pragma Assert(not Est_present(Ens1,10));
	-- Supprimer 7 en Ens1
	Supprimer(7,Ens1);
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not Est_vide(Ens1));
        pragma Assert(Taille(Ens1) = 2);
        pragma Assert(not Est_present(Ens1,2));
        pragma Assert(Est_present(Ens1,5));
        pragma Assert(not Est_present(Ens1,7));
        pragma Assert(not Est_present(Ens1,10));

	-- Supprimer 5 en Ens1
	Supprimer(5,Ens1);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not Est_vide(Ens1));
        pragma Assert(Taille(Ens1) = 1);
        pragma Assert(not Est_present(Ens1,2));
        pragma Assert(not Est_present(Ens1,5));
        pragma Assert(not Est_present(Ens1,7));
        pragma Assert(not Est_present(Ens1,10));
	-- Détruire l'ensemble
	

end Test_Ensembles_Sujet_Tableau;
