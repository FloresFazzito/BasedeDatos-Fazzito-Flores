select * from Clientes; #Punto 4
select * from Clientes where DNI=56789012; #Punto 5 (Usamos un DNI en lugar del numero 6)
select Apellido_y_nombre,Telefono from Clientes where Apellido_y_nombre like "Gar%"; #Punto 6 (Usamos apellido y nombre juntos y no separados)
select Paquete_de_viaje_id from Clientes_reservan_Paquete_de_viaje where Clientes_DNI is null; #Punto 7 (No tenemos Paquetes de viaje sin el DNI de cliente) (No seleccionamos de alojamiento sino que pusimos el ID del paquete de viaje)
select * from Clientes_reservan_Paquete_de_viaje where Paquete_de_viaje_id= null; #punto 8 
select Apellido_y_nombre,Telefono from Clientes where Apellido_y_nombre like "%ez %"; #Punto 9
update Clientes set Direccion = "San_Juan_1234" where DNI= 90123456; #punto 10
select * from Alojamiento where Categoria="Cabaña"; #Punto 11
select * from Paquete_de_viaje where Costo>6000; #Punto 12
select * from Clientes_reservan_Paquete_de_viaje where Inicio>="2017/05/01" and Fin<="2017/05/10" order by Inicio and Fin desc; #Punto 13
delete from Clientes_reservan_Paquete_de_viaje where Clientes_DNI= 90123456; #punto 14
select Costo, Tipo_de_pago, Clientes_DNI from Paquete_de_viaje join Clientes_reservan_Paquete_de_viaje on Paquete_de_viaje_id=id; #Punto 15
select * from Alojamiento join  Paquete_de_viaje on Alojamiento_Direccion=Direccion where Alojamiento_Direccion is null; #punto 16
update Alojamiento set Direccion= "Belgrano 15897" where Telefono=99887655; #punto 17
select * from Clientes_reservan_Paquete_de_viaje where Inicio>="2017/04/01" and Fin<="2017/04/30" and Cantidad_de_personas>2;#Punto 18
select Apellido_y_nombre,Telefono from Clientes  where Apellido_y_nombre like "%ar%"; #Punto 19
delete from Paquete_de_viaje where id=2; #punto 20 Justificación:no se permite borrar debido a que la entidad paquetes de viajes tiene el atributo "id" que tambien es usado en "Clientes_reservan_Paquete_de_viaje" para relacionarlos, por lo que para eliminarlo, primero tendria que eliminar la reserva que tenga ese id
delete from Clientes where DNI=56789012; #Punto 21 Justificación: No se puede borrar al cliente porque sus datos se utilizan en otros lados, por ejemplo, en la reserva se usa el DNI del cliente.
update Paquete_de_viaje set Cantidad_de_dias=7, Cantidad_de_noches=8 where Lugar= "Bariloche"; 