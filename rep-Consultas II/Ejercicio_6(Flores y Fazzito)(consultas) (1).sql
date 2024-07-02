INSERT INTO Productos VALUES (5, null , '50 unidades', '250'); #lista nula que usamos en el punto c 
select Descripción, Precio from Productos where  Precio>1000 order by precio desc; #punto a
select * from Clientes where Apellido like "P%"; #punto b
delete from Productos where Descripción is null; #punto c
select Productos_Código from Productos_has_Proveedores where Proveedores_Código=1; #punto d (usamos codigo 1 pq no tenemos ni uno con codigo=7)
select Código, Descripción, Precio, Precio*0.9 from Productos; #punto e (usamos el codigo porque no tenemos nombre)