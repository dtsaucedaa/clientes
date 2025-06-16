#!/usr/bin/perl

use lib '/Users/marcotorres/Documents/Documents - Marco’s MacBook Pro/perl';
use Data::Dumper;
use strict;
use clientes;


my $mercado = inputs();

my $clientes_datos = new clientes();
my $datos = $clientes_datos->mercado($mercado);
#print Dumper($datos); #con esto puedo imprimir el hash
foreach my $cliente(@{$datos}){
    my $agente_nombres = '';
    my $servicio_nombres = '';
    my @agentes = keys %{$cliente->{'agentes'}};
    my @servicios = keys %{$cliente->{'servicios'}};
    foreach my $agente(@agentes){
        $agente_nombres = $agente_nombres.$agente."\n";
    }
    #foreach my $servicio(@servicios){
       #$servicio_nombres = $servicio_nombres.$servicio."\n";
   # }

    foreach my $id(keys %{$cliente->{'ts'}}){
       $servicio_nombres = $servicio_nombres.$cliente->{'ts'}->{$id}->{'nombre'}.' '.$cliente->{'ts'}->{$id}->{'total'}."\n";
    }
    print <<VALORES;
numero de cliente:$cliente->{'numero'}
nombre de clienyte:$cliente->{'nombre'}
direccion:$cliente->{'direccion'}
mercado:$cliente->{'mercado'}
fecha:$cliente->{'fecha'}
ventas totales:$cliente->{'ventas_totales'}

vendedores
######################
$agente_nombres
######################

Servicios
######################
$servicio_nombres
######################
-----------------------------------------
VALORES
}

sub inputs {
    print "Que numero de mercado quieres ver?:";
    my $num_mercado = <STDIN>;
    chomp($num_mercado);

    return $num_mercado;
}