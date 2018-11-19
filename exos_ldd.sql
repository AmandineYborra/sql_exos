create database Exos_Ldd;
use Exos_Ldd;

-- Exercice 1
create table Film (
ident_film int not null,
titre text,
genre1 varchar(20),
recette float,
date_sortie date,
pays tinyint,
nb_entrée int,
date_heure_saisie datetime,
resume text);
create unique index ident_film on Film(ident_film);
create index genre_film on film(genre1, pays);

-- Exercice 2
create table realisateur(
    id_real int not null,
    constraint pk_id_real primary key (id_real));

alter table film add num_real int;
alter table film add constraint fk_real foreign key (num_real) references realisateur(id_real);
alter table film modify recette float default 0, modify pays tinyint not null, modify titre text not null;
alter table film drop foreign key fk_real;
alter table film drop index fk_real;

-- Exercice 3
create view film2 as select titre, genre1, recette, date_sortie, resume from film;
drop view film2;

-- Exercice 4
use Exos_Ldd;
rename table film to filmOld;
create table film as select * from filmOld;
drop table film;
drop table filmOld;

