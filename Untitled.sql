Create table personas(
cod_hospital integer,
dni integer primary key,
apellidos varchar(50),
funcion	varchar(30),
salario	integer,
localidad varchar(20));

insert into personas values(1,12345678,'Garci¬a Hernández, Eladio','CONSERJE',1200,'LORCA');
insert into personas values(1,87654321,'Fuentes Bermejo, Carlos','DIRECTOR',2000,'MURCIA');
insert into personas values(2,55544433,'Gonzalez Marín, Alicia','CONSERJE',1200,'MURCIA');
insert into personas values(1,66655544,'Castillo Montes, Pedro','MEDICO',1700,'MURCIA');
insert into personas values(2,22233322,'Tristan García, Ana','MEDICO',1900,'MURCIA');
insert into personas values(3,55544411,'Ruiz Hernández, Caridad','MEDICO',1900,'LORCA');
insert into personas values(3,99988333,'Serrano Díaz, Alejandro','DIRECTOR',2400,'CARTAGENA');
insert into personas values(4,33222111,'Mesa del Castillo, Juan','MEDICO',2200,'LORCA');
insert into personas values(2,22233333,'Marti¬nez Molina, Andres','MEDICO',1600,'CARTAGENA');
insert into personas values(4,55544412,'Jimenez Jimenez, Dolores','CONSERJE',1200,'MURCIA');
insert into personas values(4,22233311,'Martinez Molina, Gloria','MEDICO',1600,'MURCIA');
