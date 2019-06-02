# Laboratorio 01 Transformación de archivos con sed

# Usar el '.' para indicar decimales
sed 's/,/./g' data.csv > out.1

# Reemplazar los ;' por ','
sed 's/;/,/g' out.1 > out.2
sed 's/,/./4' out.2 > out.3

# Reemplazar '/' por '-' en la Fecha y dar formato YYYY-MM-DD
sed 's/\//-/g' out.3 > out.4
sed 's/\(^[0-9]\)-/0\1-/' out.4 > out.5
sed 's/-\([0-9]\)-/-0\1-/' out.5 > out.6
sed 's/-\([0-9][0-9]\),/-20\1,/' out.6 > out.7
sed 's/\([0-9]*\)-\([0-9]*\)-\([0-9]*\),/\3-\2-\1,/' out.7 > out.8
sed 'y/abcn/ABCN/' out.8 > out.9

# Transformar el archivo para que todos los campos nulos aparezcan como `\N`
sed 's/,,/,\\N,/' out.9 > out.10
sed 's/,N/,\\N/' out.10 > out.11
sed 's/,\r/,\\N\r/g' out.11 > data1.csv

# Extraer los registros que no tienen campos nulos
rm out.*
cat data1.csv