use boutique;

-- DANS LE TABLE CLIENT CREER DEUX CLIENTS QUI ONT LE MEME NOM :

insert into clients(nom_cli, tel_cli, adr_num_cli, adr_rue_cli, adr_ville_cli, adr_cp_cli, adr_pays) values
("Larcade", "0600000000", 22, "rue ornagier", "Tarbes", "65000", "France"),
("Larcade", "0600000001", 254, "rue jeannne d'arc", "Capvern", "65130", "France");

-- DANS LE TABLE COMMERCIAUX CREER DES COMMERCIAUX DONT LE NOM COMMENCE PAR A, C, L, M, P :

insert into commerciaux(nom_com, prenom_com, tel_com) values
("Arcade", "Alice", "0600000000"),
("Coulioure", "Corentin", "0600000011"),
("Labege", "Lorenzo", "0600000022"),
("Martin", "Marc", "0600000033"),
("Parker", "Peter", "0600000044");

-- DANS LE TABLE PRODUIT CREER DES PRODUITS SANS TYPE :

insert into produitfinis(nom_pf, prix_vente_pf, qte_stk_pf) values
("voiture en bois", 40, 100),
("chateau en plastique", 20, 200),
("puzzle", 10, 250);

-- CREER DEUX FOURNISSEURS QUI VIENNENT D’ARRIVER (L’ENTREPRISE LEUR AURA DONC RIEN ACHETE A CES FOURNISSEURS):

insert into fournisseur(nom_fourn, tel_fourn, adr_num_fourn, adr_rue_fourn, adr_ville_fourn, adr_cp_fourn, adr_pays_fourn) values
("Banner", "0600000011", 87, "rue lolos", "Tarbes", 65000, "France"),
("Barton", "0666666666", 456, "rue hachet", "Capvern", 65130, "France");

-- CREER DEUX NOUVELLES MATIERES PREMIERES (L’ENTREPRISE N’EN A DONC JAMAIS ACHETE):

insert into matprem(nom_mat, prix_achat, qte_stk_matprem) values
("fer", 25, 100),
("ver", 10, 300);

-- CREER DEUX FOURNISSEURS A QUI NOUS AVONS DEJA ACHETE UNE MATIERE PREMIERE :
-- CREER DEUX MATIERES PREMIERES QUI ONT DEJA ETE ACHETEES :

insert into fournisseur(nom_fourn, tel_fourn, adr_num_fourn, adr_rue_fourn, adr_ville_fourn, adr_cp_fourn, adr_pays_fourn) values
("Rogers", "0600000000", 352, "rue pyrenees", "Tarbes", 65000, "France"),
("Stark", "0655443322", 12, "rue dupont", "Capvern", 65130, "France");

insert into matprem(nom_mat, prix_achat, qte_stk_matprem) values
("bois", 10, 600),
("plastique", 15, 200);

insert into acheter(id_fourn, id_matprem) values
(3, 3),
(4, 4);

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS TYPEPF:

insert into typepf(nom_type_pf) value ("jouet");
delete from typepf 
where id_type_pf = 1;

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS TYPEPF QUI EST UTILISE DANS PRODUIT FINIS :

insert into typepf(nom_type_pf) value ("jouet");

update produitfinis
set id_type_pf = 2
where id_pf = 1;

delete from produitfinis
where id_type_pf = 2;

delete from typepf 
where id_type_pf = 2;

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS FIDELISER :

insert into fideliser(id_client, id_com) value (1, 1);

delete from fideliser
where id_client = 1 and id_com = 1;

-- ECRIRE UNE REQUETE QUI PERMETTRA DE CHANGER LE NOM D’UN CLIENT :

update clients
set nom_cli = "Larroque"
where id_client = 1;

-- ECRIRE UNE REQUETE QUI PERMETTRA DE RAJOUTER 20000 AU CHIFFRE D’AFFAIRE D’UN COMMERCIAL POUR UN CLIENT (VOUS AVEZ LE CHOIX DU CLIENT ET COMMERCIAL) :

insert into fideliser(id_client, id_com, chiffre_affaire) value (1, 1, 20000);