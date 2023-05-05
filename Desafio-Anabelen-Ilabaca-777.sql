CREATE DATABASE desafio_Anabelen_Ilabaca_777;

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

select * from inscritos;

#¿Cuantos registros hay?
select count (*) from inscritos;

#¿Cuántos inscritos hay en total?

select sum(cantidad) from inscritos;

#¿Cuál o cuáles son los registros de mayor antigüedad?

select * from inscritos where fecha= (select min(fecha) from inscritos);

# ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante)

select fecha, sum(cantidad) from inscritos group by fecha order by fecha;

#¿Cuántos inscritos hay por fuente?

select fuente, sum(cantidad) from inscritos  group by fuente; 

#¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día?

select fecha, sum (cantidad) as mayoria from inscritos group by fecha order by mayoria desc limit 1; 

#¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas
personas fueron?

select cantidad, fuente, fecha from inscritos where cantidad=(select max(cantidad) from inscritos where fuente='Blog');

#¿Cuántas personas en promedio se inscriben en un día?

select round(avg(cantidad),2) from inscritos; 

#¿Qué días se inscribieron más de 50 personas?

select fecha, sum (cantidad) from inscritos group by fecha having sum (cantidad) >50;

#¿Cuántas personas se registraron en promedio cada día a partir del tercer día?

select fecha, round(avg (cantidad)) as promedio from inscritos where fecha >='2021-03-01' group by fecha;