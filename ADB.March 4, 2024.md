Tareas programadas
Generar variables para hacer inserción de elementos de manera automática
Procedimientos almacenados: regresan más de un valor
Funciones: solo retornar un solo valor
Triggers: son parte de la automación, se activan cuando suceda algo, antes o después
Para poder ejecutar los trigers, procedimientos, funciones o transacciones
$$ en lugar de usar ;
Delimiter $$
Drop procedure if exists ejemplo $$ (voy a verificar si esto existe, si existe lo borro, si no
manda una advertencia)
$$ (indica que aquí termina la instrucción
create procedure ejemplo()
begin
select ‘Este es mi primer procedimiento’ as Mensaje;
end $$
Delimeter;
Call ejemplo();

(aquí si va “;” porque está dentro
de mi procedimiento)

Declarar variables:
DECLARE nombre de la variable 1, variable 2, tipo
La variable 1 y 2 van a tener un valor de 2
Tenemos varios tipos de variables INT, TINYINT, SMALLINT, FLOAT DOUBLE, DECIMAL,
VARCHAR, DATE, DATETIME
Para llamar a la variable:
Set para asignar valores a las variables
Fechas a las que se le hizo una operación:
Variable de usuario: aquellas que se pueda usar desde fuera del programa. Todas comienzan
con el @
Tenemos 3 tipos de parámetros: IN (ENTRADA), OUT (SALIDA), INOUT
Mirar el orden de las variables