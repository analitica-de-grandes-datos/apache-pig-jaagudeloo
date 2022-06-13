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
       color REGEXP '^b';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<

*/
data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
--columna_2 = FOREACH data GENERATE fid, nombre AS col_2;
nombre_color_tabla = FOREACH data GENERATE nombre AS col_1, color AS col_2;
color_coinc = FILTER nombre_color_tabla BY NOT col_2 IN('blue','black');
--color_coinc = FILTER nombre_color_tabla BY STARTSWITH(col_2,'blue') OR STARTSWITH(col_1,'K');
--nombre_coinc = FILTER color_coinc BY ST
--ordenar = ORDER apellido_tabla BY col_1 asc;
--ordenar_n = LIMIT ordenar 5;
--pegado = JOIN columna_2 BY (fid), columna_3 BY (fid);
--columna_f1 = FOREACH pegado GENERATE col_2, col_3;
--filtrado = FILTER pegado BY (letras MATCHES '{');
--pegado = JOIN columna_2 BY (fid), columna_3 BY (fid);
--columnas = FOREACH data GENERATE FLATTEN(TOKENIZE(corchetes,',')) AS col_2, FLATTEN(TOKENIZE(lista,',')) AS col_3;
--sin_alfanum = FOREACH columnas GENERATE REPLACE (col_2,'([^a-zA-Z\\s]+)','') as col_2, REPLACE (col_3,'([^a-zA-Z\\s]+)','') as col_3;
--generar_tupla = FOREACH sin_alfanum GENERATE TOTUPLE(col_2, col_3) as pareja;
--agrup = GROUP generar_tupla BY pareja;
--agrup_2 = FOREACH agrup GENERATE group, COUNT(generar_tupla);
--col_2_flat = FOREACH columnas GENERATE FLATTEN(TOKENIZE(col_2)) AS col_2;
--col_3_flat = FOREACH columnas GENERATE FLATTEN(TOKENIZE(col_3)) AS col_3;
--flatten_col3 = FOREACH columna_3 GENERATE FLATTEN(TOKENIZE(lista)) AS mapas;
--grupo_columnas = GROUP columnas BY 
--columnas = FOREACH data GENERATE letra, TOKENIZE(corchetes, ',') AS col_2, TOKENIZE(lista,',') AS col_3;
--contar = FOREACH columnas GENERATE letra, COUNT(col_2) AS col_2, COUNT(col_3) AS col_3;
--ordenar = ORDER contar BY letra, col_2, col_3 asc;
--columna_2 = FOREACH data GENERATE corchetes;
--columna_3 = FOREACH data GENERATE lista;
--flatten_col3 = FOREACH columna_3 GENERATE FLATTEN(TOKENIZE(lista)) AS mapas;
--replace_col3_1 = FOREACH flatten_col3 GENERATE REPLACE(mapas,'([^a-zA-Z\\s]+)','') AS mapas;
--grupo_letras = GROUP replace_col3_1 BY mapas;
--grupo_letras_count = FOREACH grupo_letras GENERATE group, COUNT(replace_col3_1);
STORE color_coinc INTO 'output' using PigStorage(',');
