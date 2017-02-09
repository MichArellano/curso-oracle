create sequence sec_peliculastart with 1increment by 1nomaxvalue;create sequence sec_horariostart with 1increment by 1nomaxvalue;create table pelicula (id_pelicula integer, titulo varchar2(30),sinopsis varchar2(300),constraint pk_id_pelicula primary key (id_pelicula));create table sala (num_sala integer, id_pelicula integer,constraint pk_num_sala primary key (num_sala),constraint fk1_id_pelicula foreign key (id_pelicula) referencespelicula  (id_pelicula));create table horario (id_horario integer, id_pelicula integer,fecha date,constraint pk2_id_horario  primary key (id_horario),constraint fk3_id_pelicula foreign key (id_pelicula) referencespelicula  (id_pelicula));------procedimientos------create or replace procedure guardar_pelicula (my_id_pelicula outinteger, my_titulo in varchar2, my_sinopsis in varchar2) asbegin select sec_pelicula.nextval into my_id_pelicula from dual;insert into pelicula values (my_id_pelicula, my_titulo, my_sinopsis);end;/create or replace procedure guardar_sala (my_num_sala in integer, my_id_peliculain integer) asbegin insert into sala values (my_num_sala, my_id_pelicula);end;/create or replace procedure guardar_horarios (my_id_horarios out integer, my_id_pelicula in integer , my_fecha in date)asbeginselect sec_horarios .nextval into my_id_horario from dual;insert into horario values (my_id_horario, my_id_pelicula, my_fecha);end;/
