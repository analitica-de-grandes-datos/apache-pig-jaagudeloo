/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código que genere la siguiente salida.

   Boyer,BOYER,boyer
   Coffey,COFFEY,coffey
   Conway,CONWAY,conway
   Crane,CRANE,crane
   Diaz,DIAZ,diaz
   Estes,ESTES,estes
   Fry,FRY,fry
   Garrett,GARRETT,garrett
   Guy,GUY,guy
   Hamilton,HAMILTON,hamilton
   Holcomb,HOLCOMB,holcomb
   Jarvis,JARVIS,jarvis
   Kinney,KINNEY,kinney
   Klein,KLEIN,klein
   Knight,KNIGHT,knight
   Noel,NOEL,noel
   Sexton,SEXTON,sexton
   Silva,SILVA,silva

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
--columna_2 = FOREACH data GENERATE fid, nombre AS col_2;
apellido_tabla = FOREACH data GENERATE apellido AS col_1, SIZE(apellido) AS col_2;
ordenar = ORDER apellido_tabla BY col_2 desc, col_1 desc;
ordenar_n = LIMIT ordenar 5;
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
STORE ordenar_n INTO 'output' using PigStorage(',');
