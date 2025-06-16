#!/usr/bin/perl

#imprimir todos los clientes en pantalla
#imprimir solo los clientes del mercado 1
#no imprimir los clientes de la direccion 2
#imprimir el total de clientes

#$ruta = "/Users/marcotorres/Documents/Documents - Marco’s MacBook Pro/perl";
$nombre = 'clientes.txt';
$filename = $ruta.'/'.$nombre;
open($archivo,'<',$filename);


$registros = 0;

while(<$archivo>){
    @linea = split(/,/ ,$_);
    if($linea[3] eq 'mercado1' && $linea[2] ne 'direccion2'){
        chomp($linea[4]);
        $mercado = $mercado + $linea[3];
        $registros++;

        print <<VALUES;
Numero de cliente: $linea[0]
Cliente: $linea[1]
Direccion: $linea[2]
Numero de mercado: $linea[3]
Fecha: $linea[4]
VALUES
    }
   
}

print "total de clientes: $registros\n";
close $archivo;

