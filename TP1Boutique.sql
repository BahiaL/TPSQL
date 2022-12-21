create database boutique;
use boutique;

create table utilisateur (
id_util int primary key auto_increment not null,
login_util varchar(50) not null,
mot_de_pass_util varchar(100) not null,
id_droit int not null 
)engine=innodb;

create table droit (
id_droit int primary key auto_increment not null,
nom_droit varchar(50) not null 
)engine=innodb;

alter table utilisateur
add constraint fk_attribuer_utilisateur
foreign key(id_droit)
references droit(id_droit);

create table produitfinis (
id_pf int primary key auto_increment not null,
nom_pf varchar(50) not null, 
prix_vente_pf float not null,
qte_stk_pf float not null,
id_type_pf int
)engine=innodb;

create table typepf (
id_type_pf int primary key auto_increment not null,
nom_type_pf varchar(50) not null
)engine=innodb;

create table commerciaux (
id_com int primary key auto_increment not null,
nom_com varchar(50) not null,
prenom_com varchar(50) not null,
tel_com varchar(50) not null
)engine=innodb;

create table clients (
id_client int primary key auto_increment not null,
nom_cli varchar(50) not null,
tel_cli varchar(50) not null,
adr_num_cli int not null,
adr_rue_cli varchar(50) not null,
adr_ville_cli varchar(50) not null,
adr_cp_cli varchar(50) not null,
adr_pays varchar(50) not null
)engine=innodb;

create table matprem (
id_matprem int primary key auto_increment not null,
nom_mat varchar(50) not null, 
prix_achat float not null,
qte_stk_matprem float not null
)engine=innodb;

create table fournisseur (
id_fourn int primary key auto_increment not null,
nom_fourn varchar(50) not null, 
tel_fourn varchar(50) not null,
adr_num_fourn int not null,
adr_rue_fourn varchar(50) not null,
adr_ville_fourn varchar(50) not null,
adr_cp_fourn varchar(50) not null,
adr_pays_fourn varchar(50) not null
)engine=innodb;

create table fabriquer (
id_matprem int not null,
id_pf int not null,
primary key(id_matprem, id_pf)
)engine=innodb;

create table promouvoir (
id_com int not null,
id_pf int not null,
primary key(id_com, id_pf)
)engine=innodb;

create table fideliser (
id_client int not null,
id_com int not null,
primary key(id_client, id_com),
chiffre_affaire float
)engine=innodb;

create table vendre (
id_client int not null,
id_pf int not null,
primary key(id_client, id_pf)
)engine=innodb;

create table acheter (
id_matprem int,
id_fourn int,
primary key(id_matprem, id_fourn)
)engine=innodb;

alter table produitfinis
add constraint fk_posseder_produitfinis
foreign key(id_type_pf)
references typepf(id_type_pf);

alter table promouvoir
add constraint fk_promouvoir_produitfinis
foreign key(id_pf)
references produitfinis(id_pf),
add constraint fk_promouvoir_commerciaux
foreign key(id_com)
references commerciaux(id_com);

alter table fideliser
add constraint fk_fideliser_commerciaux
foreign key(id_com)
references commerciaux(id_com),
add constraint fk_fideliser_client
foreign key(id_client)
references clients(id_client);

alter table vendre
add constraint fk_vendre_client
foreign key(id_client)
references clients(id_client),
add constraint fk_vendre_produitfinis
foreign key(id_pf)
references produitfinis(id_pf);

alter table fabriquer
add constraint fk_fabriquer_produitfinis
foreign key(id_pf)
references produitfinis(id_pf),
add constraint fk_fabriquer_matprem
foreign key(id_matprem)
references matprem(id_matprem);

alter table acheter
add constraint fk_acheter_matprem
foreign key(id_matprem)
references matprem(id_matprem),
add constraint fk_acheter_fournisseur
foreign key(id_fourn)
references fournisseur(id_fourn);