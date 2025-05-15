s/\b[a-zA-Z]{3}[0-9]{3}\b/XYZ000/g
s/@[0-9]{8}/@XXXXXXXX/g
s/[0-4]\.[0-9]{1,3}/X.X/g
/^X+/d
s/[ABCDF][+-]/X/g
s/\b[ABCDF]\b/X/g
