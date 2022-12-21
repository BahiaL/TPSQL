create database gestionmatchs;
use gestionmatchs;

create table joueur (
id_joueur int primary key auto_increment not null,
nom_joueur varchar(50) not null,
prenom_joueur varchar(50) not null,
age_joueur int not null,
id_poste int not null,
id_equipe int not null 
)engine=innodb;

create table poste (
id_poste int primary key auto_increment not null,
nom_poste varchar(50) not null 
)engine=innodb;

create table equipe (
id_equipe int primary key auto_increment not null,
nom_equipe varchar(50) not null 
)engine=innodb;

create table matchs (
id_match int primary key auto_increment not null,
date_match datetime not null,
id_competition int not null,
id_stade int(50) not null,
id_phase int not null
)engine=innodb;

create table competition (
id_competition int primary key auto_increment not null,
nom_competition varchar(50) not null,
date_competition date not null 
)engine=innodb;

create table phases (
id_phase int primary key auto_increment not null,
nom_phase varchar(50) not null 
)engine=innodb;

create table stade (
id_stade int primary key auto_increment not null,
nom_stade varchar(50) not null,
nom_rue_stade varchar(50) not null,
num_rue_stade int not null,
cp_stade int not null,
ville_stade varchar(50) not null  
)engine=innodb;

create table participer (
id_equipe int not null,
id_equipe2 int not null,
id_match int not null,
primary key(id_equipe1, id_equipe2, id_match),
score_equipe1 int not null,
score_equipe2 int not null
)engine=innodb;

alter table joueur
add constraint fk_qualifier_joueur
foreign key(id_poste)
references poste(id_poste),
add constraint fk_integrer_joueur
foreign key(id_equipe)
references equipe(id_equipe);

alter table matchs
add constraint fk_completer_match
foreign key(id_phase)
references phases(id_phase),
add constraint fk_contenir_match
foreign key(id_competition)
references competition(id_competition),
add constraint fk_localiser_match
foreign key(id_stade)
references stade(id_stade);

alter table participer
add constraint fk_participer_match
foreign key(id_match)
references matchs(id_match),
add constraint fk_participer_equipe1
foreign key(id_equipe1)
references equipe(id_equipe),
add constraint fk_participer_equipe2
foreign key(id_equipe2)
references equipe(id_equipe);