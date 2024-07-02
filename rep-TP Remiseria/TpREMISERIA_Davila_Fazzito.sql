CREATE TABLE cliente (
  id int,
  dni int, 
  apellido varchar(45), 
  nombre varchar(45),
  telefono int, 
  Direccion varchar(45),
  Observaciones varchar(45),
  PRIMARY KEY (id)
);
CREATE TABLE chofer (
  id int ,
  dni int ,
  apellido varchar(45) ,
  nombre varchar(45) ,
  telefono int,
  Direccion varchar(45),
  PRIMARY KEY (id)
);
CREATE TABLE autos (
  Patente int,
  Modelo varchar(45),
  PRIMARY KEY (Patente)
);
CREATE TABLE Cuenta_corriente(
  id int NOT NULL,
  Plata int,
  cliente_id int ,
  cliente_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);
CREATE TABLE viaje(
  id int ,
  Fecha date ,
  Destino varchar(45),
  Hora_de_llegada datetime,
  costo int ,
  Direccion varchar(45),
  cliente_id int,
  autos_patente int,
  Chofer_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente (id),
  FOREIGN KEY (autos_patente) REFERENCES autos (Patente),
  FOREIGN KEY (Chofer_id) REFERENCES chofer (id),
   CHECK (costo > 0)
); 
INSERT INTO viaje VALUES (1,'2023-10-25','Ciudad A','2024-06-25 08:00:00',100,'Calle Principal 123',2002,2424,2002),(2,'2023-10-20','Ciudad B','2024-06-26 10:30:00',120,'Avenida Central 456',20202,244,2004),(3,'2023-10-20','Ciudad C','2024-06-27 12:15:00',110,'Plaza Mayor 789',20202,224,2004),(4,'2024-06-28','Ciudad D','2024-06-28 14:00:00',150,'Calle Secundaria 321',23002,2442,2008),(5,'2024-06-29','Ciudad E','2024-06-29 16:45:00',130,'Avenida Principal 654',21002,24242,2010),(6,'2024-07-01','Ciudad F','2024-07-01 09:30:00',140,'Calle Peatonal 987',2002,2424,2002),(7,'2024-07-02','Ciudad G','2024-07-02 11:00:00',115,'Bulevar Central 741',20202,244,2004),(8,'2024-07-03','Ciudad H','2024-07-03 13:45:00',125,'Avenida Principal 852',20402,224,2006),(9,'2024-07-04','Ciudad I','2024-07-04 15:30:00',135,'Plaza Central 963',23002,2442,2008),(10,'2024-07-05','Ciudad J','2024-07-05 17:15:00',145,'Calle Principal 147',21002,24242,2010);
INSERT INTO Cuenta_corriente VALUES (1,-23123,2002),(2,23,20202),(93,17331,21002),(939,1731,2002),(9139,174341,20402),(9239,173231,20202),(9539,173661,23002);
INSERT INTO autos VALUES (224,'r2'),(244,'r8'),(2424,'r4'),(2442,'r84'),(24242,'r42');
INSERT INTO chofer VALUES (2002,455522,'ofelia','ojeda',312141,'helguera 2000'),(2004,4544322,'ofelias','ojedsaa',31211,'helguera 4000'),(2006,53522,'ofelwia','ojedera',3156741,'helguera 6000'),(2008,4554232,'pofelia','orjeda',319743,'helguera 8000'),(2010,4598485,'pofekea','orjteda',359763,'helguera 9000');
INSERT INTO cliente VALUES (2002,455522,'ofelia','ojeda',312141,'helguera 2005','lentes oscuros'),(20202,13412,'ofeliag','ojseda',31141,'Condarco 2005','arito'),(20402,4522,'ofeliat','ojedac',3121451,'helgueras 2005','rapado costados'),(21002,22,'ofelida','ojteda',3122141,'helsguera 2005','campera negra'),(23002,522,'ofeslia','ojeyda',141,'helguera 20','lentes ');



alter table viaje add check(costo>0);#3
delete from chofer where id =1;#8
delete from viaje where cliente_id=3;#9
select count(patente) from autos;#10
select avg(costo)from viaje where cliente_id = 4;#11
select max(costo) from viaje where cliente_id= 3;#12
select * from cliente where nombre like "A%";#13
SELECT * from viaje where Fecha between "2023-10-10" and "2023-10-30" order by Destino asc;#14
select plata from Cuenta_corriente where cliente_id=5;#15
select count(id) from viaje group by Chofer_id;#16
select costo*1.21 from viaje;#17
select max(costo) from viaje;#18
select min(costo) from viaje;#19
select count(id) from viaje group by Fecha, Chofer_id;#20
select count(id)from viaje group by cliente_id having count(id) > 5;#21
select * from cliente join Cuenta_corriente on cliente_id=cliente.id where plata <0;#22
select autos.*,chofer.nombre, chofer.apellido, viaje.autos_Patente, viaje.costo from autos join viaje on patente = autos_patente join chofer on chofer.id= Chofer_id where chofer.id = 4;#23
select count(viaje.id), cliente.nombre, cliente.apellido, cliente.id from viaje join cliente on cliente.id = cliente_id where Fecha between "2023-01-01" and "2023-12-30" group by cliente.id;#24
select count(viaje.id), sum(costo), sum(costo)*0.18 from viaje; #25 
