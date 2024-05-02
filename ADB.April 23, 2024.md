
Las transacciones son 
- Atómicas. Se aplican todas o ninguna.
- Consistentes. Garantizan la consistencia de los datos.
- Aislada. Bloquean la información de los datos que está usando.
- Permanente. Una vez que se completan, deben de permanecer.

El motor de bases de datos SQL que acepta transacciones es InnoDB.

Para trabajar en las transacciones debemos conectarnos a una instancia y para saber que estamos conectados a una instancia utilizamos un connection id.

Tenemos 4 modelos de aislamiento.
- Lectura no confirmada. Permite al modelo leer filas que no han sido confirmadas.
- Lectura confirmada. Solo se permiten datos que han sido confirmados, si un usuario está ejecutando un procedimiento que recorre las filas recuperadas de una tabla mediante una secuencia SELECT
- Lectura repetible
- Secuenciable. El bloqueo dura hasta.

Para hacer transacciones, debemos solicitar un commit de un id y deshabilitar el commit. Para este ejemplo simulamos que tenemos 2 usuarios:
- Usuario 1
  ```sql
  SELECT connection_id(); -- This retrieves the value of the current connection, it is diferent if we have another user interacting with the db.

  select @@autocommit;
  set autocommit = 0;
  insert into alumnos values(9, 'alumno 9');
  select * from alumnos where id=9;
  commit;
  update alumnos
  set alumno = 'Alberto Carrera' where id=1;
  select * from alumnos where id=1;
  select * from alumnos where id=2;
  commit;
  ```
- Usuario 2
  ```sql
  SELECT * FROM alumnos where id=9;
  commit;
  SELECT * from alumnos where id=1;
  update alumnos set alumno = 'Raquel Carrera' where id=2;
  select * from alumnos where id=2;

  commit;
  ```

Hay varias operaciones que podemos realizar, entre estás están:
- COMMIT
- ROLLBACK
- SAVEPOINT
- ROLLBACK TO SAVEPOINT
- SET TRANSACTION, permite cambiar el nivel de aislamiento de la transacción.
- LOCK TABLES, bloquea explicitamente una o varias tablas, a la vez cierra todas las transacciones abiertas