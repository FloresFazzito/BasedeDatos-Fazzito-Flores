select min(Cantidad_de_dias) from Paquete_de_viaje; #punto 1
select max(Cantidad_de_dias) from Paquete_de_viaje; #punto 2
select avg(Costo) from Paquete_de_viaje where Cantidad_de_dias=3; #punto 3
select count(Clientes_DNI) from Clientes_reservan_Paquete_de_viaje where Inicio>="2017/07/01" and Fin<="2017/07/31"; #punto 4 (hicimos el ejercicio solo con las fechas del 2017)
select distinct(Lugar) from Paquete_de_viaje; #punto 5
select sum(Cantidad_de_excursiones) from  Paquete_de_viaje where Lugar="Bariloche"; #punto 6
select count(Clientes_DNI) from Clientes_reservan_Paquete_de_viaje where Paquete_de_viaje_id=1; #punto 7
select count(Paquete_de_viaje_id), Paquete_de_viaje_id from Clientes_reservan_Paquete_de_viaje group by Paquete_de_viaje_id;
update Paquete_de_viaje set Costo=Costo*1.1;#punto 9
select count(id) from Paquete_de_viaje group by Alojamiento_Direccion; #punto 10
update Paquete_de_viaje set Cantidad_de_excursiones=Cantidad_de_excursiones+1 where Lugar="Salta"; #punto 11
select sum(Costo), Lugar from Paquete_de_viaje group by Lugar; #punto 12
select Alojamiento_Direccion from Paquete_de_viaje group by Alojamiento_Direccion having count(Alojamiento_Direccion)>=3; #punto 13
#punto 14
#punto 15
select avg(Cantidad_de_personas), Paquete_de_viaje_id from Clientes_reservan_Paquete_de_viaje group by Paquete_de_viaje_id; #punto 16
