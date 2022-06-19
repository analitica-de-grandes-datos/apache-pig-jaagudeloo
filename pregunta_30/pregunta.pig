/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
salida.

   1971-07-08,08,8,jue,jueves
   1974-05-23,23,23,jue,jueves
   1973-04-22,22,22,dom,domingo
   1975-01-29,29,29,mie,miercoles
   1974-07-03,03,3,mie,miercoles
   1974-10-18,18,18,vie,viernes
   1970-10-05,05,5,lun,lunes
   1969-02-24,24,24,lun,lunes
   1974-10-17,17,17,jue,jueves
   1975-02-28,28,28,vie,viernes
   1969-12-07,07,7,dom,domingo
   1973-12-24,24,24,lun,lunes
   1970-08-27,27,27,jue,jueves
   1972-12-12,12,12,mar,martes
   1970-07-01,01,1,mie,miercoles
   1974-02-11,11,11,lun,lunes
   1973-04-01,01,1,dom,domingo
   1973-04-29,29,29,dom,domingo

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
--, GetMonth(fecha) AS col_2, SUBSTRING(fecha, 5, 6) AS col_3;
--consulta = FILTER tabla_nombre BY SUBSTRING(col_1, 0, 1) MATCHES 'M' OR SUBSTRING(col_1, 0, 1) MATCHES 'N' OR SUBSTRING(col_1, 0, 1) MATCHES 'O' OR SUBSTRING(col_1, 0, 1) MATCHES 'P' OR SUBSTRING(col_1, 0, 1) MATCHES 'Q' OR SUBSTRING(col_1, 0, 1) MATCHES 'R' OR SUBSTRING(col_1, 0, 1) MATCHES 'S' OR SUBSTRING(col_1, 0, 1) MATCHES 'T' OR SUBSTRING(col_1, 0, 1) MATCHES 'U' OR SUBSTRING(col_1, 0, 1) MATCHES 'V' OR SUBSTRING(col_1, 0, 1) MATCHES 'W' OR SUBSTRING(col_1, 0, 1) MATCHES 'X' OR SUBSTRING(col_1, 0, 1) MATCHES 'Y' OR SUBSTRING(col_1, 0, 1) MATCHES 'Z';
--indice = FOREACH tabla_nombre GENERATE INDEXOF(col_1,'ia',1);
--extraccion = FOREACH tabla_fecha GENERATE REGEX_EXTRACT(col_1, '(.*)-(.*)-(.*)', 2) AS col_1;
--nombre_color_tabla = FOREACH data GENERATE nombre AS col_1, color AS col_2;
--color_coinc = FILTER nombre_color_tabla BY ENDSWITH(col_2,'a') OR ENDSWITH(col_2,'e') OR ENDSWITH(col_2,'i') OR ENDSWITH(col_2,'o') OR ENDSWITH(col_2,'u');
--color_coinc = FILTER nombre_color_tabla BY col_2 IN('blue','green');
--color_coinc = FILTER nombre_color_tabla BY NOT STARTSWITH(col_2,'b');
--color_coinc = FILTER nombre_color_tabla BY NOT col_2 IN('blue','black');
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
STORE tabla_fecha INTO 'output' using PigStorage(',');
