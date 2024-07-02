SELECT * FROM `TP2 turismo`.clientes;
#tablas
create table CuentaCorriente (codigoCC INT, saldo INT,
Primary key (CodigoCC));
create table Clientes (idCliente INT primary key,DNI INT, Apellido VARCHAR (45), Nombre VARCHAR (45), Direccion VARCHAR (45), Telefono INT, Observaciones VARCHAR (45), CuentaCorriente_codigoCC INT,
foreign key (CuentaCorriente_codigoCC) references CuentaCorriente(codigoCC));
create table Choferes (idChoferes INT primary key, DNI_chofer INT, Apellido_chofer VARCHAR (45), Nombre_chofer VARCHAR (45), Direccion_chofer VARCHAR (45), Telefono_chofer INT);
create table Viajes (idviaje INT primary key, Fecha DATETIME, Destino VARCHAR (45), Hora_de_llegada TIME, Costo INT,CuentaCorriente_codigoCC int,Choferes_idChoferes int,
foreign key (CuentaCorriente_codigoCC) references CuentaCorriente(codigoCC),
foreign key (Choferes_idChoferes) references Choferes(idChoferes),
check (Costo>0)); #punto 3
create table autos(Patente varchar(45) primary key,Modelo varchar(45),Choferes_idChoferes2 int,
foreign key (Choferes_idChoferes2) references Choferes(idChoferes));
#inserts
INSERT INTO CuentaCorriente (codigoCC, saldo) VALUES
(567, 450),
(568, 451),
(569, 452),
(570, 453),
(571, 454);
#punto 4
INSERT INTO Clientes (idCliente, DNI, Apellido, Nombre, Direccion, Telefono, Observaciones, CuentaCorriente_CodigoCC) VALUES
(1, 12345678, 'Apellido1','Nombre1', 'Direccion1', 111111111, 'Observaciones Cliente 1',567),
(2, 23456789, 'Apellido2', 'Nombre2', 'Direccion2', 222222222, 'Observaciones Cliente 2', 568), 
(3, 34567890, 'Apellido3', 'Nombre3', 'Direccion3', 333333333, 'Observaciones Cliente 3', 569),
(4, 45678901, 'Apellido4', 'Nombre4', 'Direccion4', 444444444, 'Observaciones Cliente 4', 570),
(5, 56789012, 'Apellido5', 'Nombre5', 'Direccion5', 555555555, 'Observaciones Cliente 5', 571);
#punto 7
INSERT INTO Choferes (idChoferes, DNI_chofer, Apellido_chofer, Nombre_chofer, Direccion_chofer, Telefono_chofer) VALUES
(6, 12345677, 'Apellido6', 'Nombre6', 'Direccion6', 111111112),
(7, 23456788, 'Apellido7', 'Nombre7', 'Direccion7', 222222223), 
(8, 34567899, 'Apellido8', 'Nombre8', 'Direccion8', 333333334),
(9, 45678900, 'Apellido9', 'Nombre9', 'Direccion9', 444444445),
(10, 56789011, 'Apellido10', 'Nombre10', 'Direccion10', 555555556);
#punto 5
INSERT INTO Viajes (idviaje, Fecha , Destino , Hora_de_llegada, Costo ,CuentaCorriente_codigoCC ,Choferes_idChoferes) VALUES
(11, "2020-01-10", 'salta', '12:30:01', 111,567,6), 
(12, "2020-02-10", 'jujuy', '12:30:02', 222,568,7),
(13, "2020-03-10", 'cordoba', '12:30:03', 333,569,8),
(14, "2020-04-10", 'neuquen', '12:30:04', 444,570,9),
(15, "2020-05-10", 'rionegro', '12:30:05', 555,571,10),
(16, "2020-06-10", 'catamarca', '12:30:06', 666,567,6),
(17, "2020-07-10", 'caba', '12:30:07', 777,568,7), 
(18, "2020-08-10", 'misiones', '12:30:08', 888,569,8),
(19, "2020-09-10", 'entrerios', '12:30:09', 999,570,9),
(20, "2020-10-10", 'chaco', '12:30:10', 1000,571,10);
#punto 6
INSERT INTO autos (Patente, Modelo, Choferes_idChoferes2) VALUES
("KVP 980", "Corsa", 6),
("KVP 981", "Corsav", 7),
("KVP 982", "Corsak", 8),
("KVT 986", "Corsat", 9),
("KVT 987", "Corsas", 10);
delete from Choferes where idChoferes=1; #punto 8
delete from Viajes where CuentaCorriente_codigoCC = 3; #punto 9 (hicimos relacion cliente-cuentacorriente asi que le cambiamos el codigo a codigo corriente)
select count(Patente) from autos; #punto 10
select avg (Costo) from Viajes where CuentaCorriente_codigoCC =4; #punto 11
select max(Costo) from Viajes where CuentaCorriente_codigoCC =3;#punto12
select * from Clientes where Nombre like "A%"; #punto13
select * from Viajes where Fecha>="2023-10-10" and Fecha<="2023-10-30";#punto14
select saldo from CuentaCorriente join Clientes on codigoCC = CuentaCorriente_codigoCC where idCliente =5; #punto 15 (el saldo es positivo así que simplemente mostramos su saldo disponible)
select count(idviaje) from Viajes group by Choferes_idChoferes; #punto 16 (imprime 2 en 5 viajes ya que, en nuestro caso, cada chofer realiza 2 viajes)
update Viajes set Costo=Costo+Costo*0.21; #punto 17
select max(Costo) from Viajes; #punto 18
select min(Costo) from Viajes; #punto 19
select count(idviaje)from Viajes group by Fecha, Choferes_idChoferes; #punto 20
select count(codigoCC) from CuentaCorriente group by codigoCC having count(codigoCC)>5; #punto 21 (como la relacion es cliente-cuentacorriente, lo hicimos para aquellos con ID>5)
select saldo from CuentaCorriente; #Punto 22 (en nuestro caso, todas tienen cuenta corriente asi que mostramos todos los saldos)
select Nombre_chofer, Apellido_chofer, Patente, Costo from autos join Choferes on Choferes_idChoferes2=idChoferes join Viajes on idChoferes=Choferes_idChoferes; #Punto 23
#punto 24
#punto 25 
