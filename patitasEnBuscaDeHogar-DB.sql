drop database if exists PatitasEnBuscaDeHoga_in5cm;
create database PatitasEnBuscaDeHoga_in5cm;

use PatitasEnBuscaDeHoga_in5cm;

create table Refugio(
	id_refugio int auto_increment,
	nombreRefugio varchar(100),
	direccionRefugio varchar(200),
    telefonoRefugio bigint,
    primary key PK_id_refugio(id_refugio)
);
create table Especie(
	id_especie int auto_increment,
	nombreEspecie varchar(100),}
    primary key PK_id_especie(id_especie)
);

create table Raza(
	id_raza int auto_increment,
	nombreRaza varchar(100),
	id_especie int,
    primary key PK_id_raza(id_raza),
    constraint FK_id_especie foreign key (id_especie)
	references Especie(id_especie) on delete cascade
);

create table Animal(
	id_animal int auto_increment,
	nombreAnimal varchar(100),
	edadAnimal int,
	sexoAnimal varchar(50),
	estadoAnimal enum('Disponible', 'Reservado', 'En veterianaria', 'Adoptado'),
	id_refugio int,
	id_especie int,
	id_raza int,
    primary key PK_id_animal(id_animal),
    constraint FK_id_refugio foreign key (id_refufio)
    references Refugio(id_refugio) on delete cascade,
    constraint Fk_id_especie foreign key (id_especie)
    references Especie(id_especie) on delete cascade,
    constraint Fk_id_raza foreign key (id_raza)
    references Raza(id_raza)on delete cascade
);

create table Veterinario(
	id_veterinario int auto_increment,
	nombreVeterinario varchar(100),
	telefonoVeterinario bigint,
    primary key PK_id_veterinario(id_veterinario)
);
create table Vacuna(
	id_vacuna int auto_increment,
	nombreVacuna enum('Antirrabica', 'Moquillo', 'Parvovirus', 'Complejos Respiratorios').
	fechaDeAplicacion date,
    id_animal int,
	id_veterinario int,
    primary key id_vacuna(id_vacuna),
    constraint Fk_id_animal foreign key (id_animal)
    references Animal(id_animal) on delete cascade
);

create table Adoptante(
	id_adoptante int auto_increment,
	nombreAdoptante varchar(100),
	telefonoAdoptante bigint,
	direccion varchar(200),
    primary key id_adoptante(id_adoptante)
);
create table Adopcion(
	id_adopcion int auto_increment,
	fechaDeAdopcion date,
	id_animal int,
	id_adoptante int,
    primary key id_adopcion(id_adopcion),
    constraint Fk_id_animal foreign key (id_animal)
    references Animal(id_animal) on delete cascade,
    constraint Fk_id_adoptante foreign key (id_adoptante)
    references Adoptante(id_adoptante)
);

