#!/usr/bin/perl

$ruta = "/Users/marcotorres/Documents/Documents - Marco’s MacBook Pro/perl";
$nombre = 'jugadores.txt';
$filename = $ruta.'/'.$nombre;
open($archivo,'<',$filename);

$registros = 0;
$suma_edades = 0;
$promedio = 0;
$temporadas = 0;
$promedio_temporadas = 0;
while(<$archivo>){
    @linea = split(/,/ ,$_);
    if($linea[4] >= 5 && $linea[3] > 17){
        $genero = '';
        chomp($linea[5]);
        if($linea[5] eq 'H'){
            $genero = 'Hombre';
        } else {
            $genero = 'Mujer';
        }
        $suma_edades = $suma_edades + $linea[3];
        $temporadas = $temporadas + $linea[4];

    
        print <<VALUES;
Nombre: $linea[0]
Apellido paterno: $linea[1]
Apellido materno: $linea[2]
Edad: $linea[3]
temporadas: $linea[4]
Genero: $genero '$linea[5]'
------------------------------------
VALUES
        $registros++;
    }
    
}
print "registros procesados: $registros\n";
close $archivo;


$promedio = $suma_edades/$registros;
print "promedio: $promedio\n";

$promedio_temporadas = $temporadas/$registros;
print "promedio temp: $promedio_temporadas\n";


