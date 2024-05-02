Primero que nada, debemos tener claro que no todas las bases de datos son transaccionales (BDT). ¿Qué son o que carácteriza a las BDT? Una BDT guarda datos resultantes de la interacción entre 2 o más partes. 

Las transacciones son secuencias de operaciones realizadas de forma ordenada, simbolizando una unidad de coherente y confiable que es independiente de otras transacciones. Tienen como objetivo proporcionar una manera de recuperarse facilmente ante los errores, y así mantener una base de datos consistente a pesar de fallos del sistema, así mismo, aislar la alteración de datos simultanea por distintos programas.
En la práctica, suele consistir en la agrupación de consultas del lenguaje de manipulación y consulta de datos.

El patrón de una transacción suele ser el siguiente:
1. Iniciar la transacción.
2. Ejecutar una serie de comandos para manipular datos o querys para consultarlos.
3. Si no ocurren errores, confirmar transacción.
4. Si ocurren errores, retroceder transacicón, haciendo que con ella se vayan todos los comandos ejecutados.

Si hablamos de una base de datos basada en objetos. Se dice que las transacciones ocurren igual. La diferencia fundamental está en lo que ocurre en medio ya que la transacción bloquea a los registros que utiliza para liberarlos una vez que la transacción se confirmo o se regresó.

https://stackoverflow.com/questions/6934007/difference-between-transactional-and-reporting-database 