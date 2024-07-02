CREATE TABLE `Clientes` (
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `DNI` int NOT NULL,
  `Dirección` varchar(45) DEFAULT NULL,
  `Fecha de nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`DNI`)
);
CREATE TABLE `Proveedores` (
  `DNI` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
);
CREATE TABLE `Productos` (
  `Codigo` int NOT NULL,
  `Precio unitario` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Proveedores_DNI` int,
  PRIMARY KEY (`Codigo`),
  FOREIGN KEY (`Proveedores_DNI`) REFERENCES `Proveedores` (`DNI`)
  on delete set null
  on update cascade
  );
CREATE TABLE `Clientes_has_Productos` (
  `Clientes_DNI` int,
  `Productos_Codigo` int,
  PRIMARY KEY (`Clientes_DNI`,`Productos_Codigo`),
  FOREIGN KEY (`Clientes_DNI`) REFERENCES `Clientes` (`DNI`)
  on delete restrict
  on update cascade,
  FOREIGN KEY (`Productos_Codigo`) REFERENCES `Productos` (`Codigo`)
);
create table Cabaña(
Alojamiento_Direccion varchar (45) not null,
Parilla varchar (45),
Garaje varchar (45),
PRIMARY KEY (Alojamiento_Direccion),
foreign key (Alojamiento_Direccion) references Alojamiento(Direccion)
on delete restrict
on update cascade
);
create table Paquete_de_viaje (
id int not null,
Cantidad_de_excursiones int,
Viaje varchar (45),
Cantidad_de_dias int,
Cantidad_de_noches int, 
Costo int,
Tipo_de_pago varchar (45),
Lugar varchar (45),
Alojamiento_Direccion varchar (45),
PRIMARY KEY (id),
foreign key (Alojamiento_Direccion) references Alojamiento(Direccion)
on delete cascade
on update SET NULL
);
create table Clientes_reservan_Paquete_de_viaje (
Clientes_DNI int not null,
Paquete_de_viaje_id int not null,
Inicio DATE,
Fin DATE,
Cantidad_de_personas int,
PRIMARY KEY (Clientes_DNI, Paquete_de_viaje_id),
foreign key (Clientes_DNI) references Clientes(DNI)
on delete cascade
on update restrict,
foreign key (Paquete_de_viaje_id) references Paquete_de_viaje(id)
on delete cascade
on update restrict
);

UPDATE `TP_Turismo_tablas`.`Alojamiento` SET `Direccion` = '21' WHERE (`Direccion` = '12');
delete from Alojamiento;


UPDATE `TP_Turismo_tablas`.`Clientes` SET `DNI` = '111' WHERE (`DNI` = '112');
delete from Clientes;

update Clientes set DNI=8765 where DNI=1234;
delete from Clientes;










