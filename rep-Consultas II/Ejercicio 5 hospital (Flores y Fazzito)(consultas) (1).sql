select Nombre from Medico where Especialidad="traumatologo" order by Apellido asc; #punto a
delete from Ingresos where `Fecha de ingreso` <"2018-05-01"; #Punto b
select `Codigo postal` from Paciente where Apellido = "Apellido1"; #Punto c (usamos Codigo Postal en vez de Camas y Apellido en vez de Numero de paciente)
update Medico set Especialidad = "Pediatria" where codigo=10; #punto d (en vez de id 5,usamos id 10)
select Nombre, Codigo from Medico where Nombre like "G%"; #Punto e (usamos apellido en lugar de nombre)
