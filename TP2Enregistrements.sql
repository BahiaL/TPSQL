use gestionmatchs;

insert into poste(nom_poste) values
("Attaquant"), 
("Libero"), 
("Defenseur"), 
("Gardien");

insert into equipe(nom_equipe) values
("France"),
("Argentine"),
("Maroc");

insert into joueur(nom_joueur, prenom_joueur, age_joueur, id_poste, id_equipe) values
("Lloris", "Hugo", 35, 4, 1),
("Hernandez", "Theo", 25, 3, 1),
("Mbappe", "Kylian", 24, 1, 1);

insert into phases(nom_phase) values
("Première"),
("Seconde"),
("Troisième");

insert into competition(nom_competition, date_competition) values
("Amicale", "2022-06-26"),
("Mondiale", "2022-12-18"),
("Regionale", "2022-02-05");

insert into stade(nom_stade, nom_rue_stade, num_rue_stade, cp_stade, ville_stade) values
("Stade de Paris", "rue orangier", 3, 75000, "Paris"),
("Stade de Toulouse", "rue jeanne d'arc", 541, 31000, "Toulouse"),
("Stade de Tarbes", "rue des pyrenees", 25, 65000, "Tarbes");

insert into matchs(date_match, id_competition, id_stade, id_phase) values
("2022-06-26 22:30:00", 1, 3, 1),
("2022-12-18 16:00:00", 2, 1, 3),
("2022-02-05 06:15:00", 3, 2, 2);

insert into participer(id_equipe1, id_equipe2, id_match, score_equipe1, score_equipe2) values
(1, 2, 2, 3, 3),
(2, 3, 1, 3, 1),
(1, 3, 3, 2, 1);

