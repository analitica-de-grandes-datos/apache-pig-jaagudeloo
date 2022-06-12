/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, numero:int);
--columna_0 = FOREACH data GENERATE letra as word_0;
--columna_1 = FOREACH data GENERATE fecha as word_1;
--columna_2 = FOREACH data GENERATE numero as num_0;
--grouped = GROUP renglon BY word;
ordered_data = ORDER data BY letra, numero asc;
STORE ordered_data INTO 'output' using PigStorage(',');