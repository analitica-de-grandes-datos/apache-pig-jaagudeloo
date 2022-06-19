/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color 
   FROM 
       u 
   WHERE 
       color REGEXP '[aeiou]$';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
nombre_color_tabla = FOREACH data GENERATE nombre AS col_1, color AS col_2;
color_coinc = FILTER nombre_color_tabla BY ENDSWITH(col_2,'a') OR ENDSWITH(col_2,'e') OR ENDSWITH(col_2,'i') OR ENDSWITH(col_2,'o') OR ENDSWITH(col_2,'u');
STORE color_coinc INTO 'output' using PigStorage(',');
