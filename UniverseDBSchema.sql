drop database universe;
create database universe;
use universe;

drop table if exists Capitulo;
drop table if exists ActorHistoria;
drop table if exists Historia;
drop table if exists Actor;

create table Actor(
	id int AUTO_INCREMENT,
	nombre varchar(250) not null,
	primary key (id)
);

create table Historia(
	id int AUTO_INCREMENT,
	nombre varchar(250) not null,
	tipo varchar(250) not null,
	sinopsis varchar(150) not null,
	primary key (id)
);


create table ActorHistoria(
	idActor int,
	idHistoria int not null,	
	primary key (idActor,idHistoria),
	foreign key (idActor) references Actor (id) on delete restrict on update cascade,
	foreign key (idHistoria) references Historia (id) on delete restrict on update cascade 

);


create table Capitulo(
	id int AUTO_INCREMENT,
	idHistoria int,
	nombre varchar(250),
	contenido TEXT,
	primary key (id, idHistoria),
	foreign key (idHistoria) references Historia (id) on delete restrict on update cascade
);




insert into Actor(id,nombre) values (1,'Demacia');
insert into Actor(id,nombre) values (2,'Noxus');
insert into Actor(id,nombre) values (3,'Ionia');


insert into Historia(id,nombre,tipo,sinopsis) values (1,'Corazón de roble','Historia de un guardian','Queen busca a intrusos en el bosque.');
insert into Historia(id,nombre,tipo,sinopsis) values (2,'Al filo de la hoja','Historia crecimiento','Historia de crecimiento de Talon.');
insert into Historia(id,nombre,tipo,sinopsis) values (3,'Antes de la caida','Historia larga','Aldeanos de Ionia, preaparandose para la invación Noxus.');

insert into ActorHistoria(idActor,idHistoria) values (1,1);
insert into ActorHistoria(idActor,idHistoria) values (2,2);
insert into ActorHistoria(idActor,idHistoria) values (3,3);


insert into Capitulo(id,idHistoria,nombre,contenido) values (1,1,'El aviso','Lorem ipsum dolor sit amet consectetur adipiscing elit dictumst, nibh sodales feugiat venenatis pulvinar primis dignissim, dis phasellus tristique lobortis porta fringilla pharetra. Ligula ac iaculis mus aliquam viverra volutpat dis ultrices vel urna orci, libero faucibus pharetra senectus ullamcorper tristique eu luctus metus mattis aptent nostra, fames fringilla sollicitudin aenean ad et eget varius diam venenatis. Luctus eget elementum ligula senectus et rutrum dis, purus laoreet sociis feugiat quam lacinia hac, sed nostra risus in convallis euismod.');
insert into Capitulo(id,idHistoria,nombre,contenido) values (1,2,'Preparación','Lorem ipsum dolor sit amet consectetur adipiscing elit dictumst, nibh sodales feugiat venenatis pulvinar primis dignissim, dis phasellus tristique lobortis porta fringilla pharetra. Ligula ac iaculis mus aliquam viverra volutpat dis ultrices vel urna orci, libero faucibus pharetra senectus ullamcorper tristique eu luctus metus mattis aptent nostra, fames fringilla sollicitudin aenean ad et eget varius diam venenatis. Luctus eget elementum ligula senectus et rutrum dis, purus laoreet sociis feugiat quam lacinia hac, sed nostra risus in convallis euismod.');
insert into Capitulo(id,idHistoria,nombre,contenido) values (1,3,'Las espinas de la rosa','Lorem ipsum dolor sit amet consectetur adipiscing elit dictumst, nibh sodales feugiat venenatis pulvinar primis dignissim, dis phasellus tristique lobortis porta fringilla pharetra. Ligula ac iaculis mus aliquam viverra volutpat dis ultrices vel urna orci, libero faucibus pharetra senectus ullamcorper tristique eu luctus metus mattis aptent nostra, fames fringilla sollicitudin aenean ad et eget varius diam venenatis. Luctus eget elementum ligula senectus et rutrum dis, purus laoreet sociis feugiat quam lacinia hac, sed nostra risus in convallis euismod.');

















