package clientes;

use lib '/Users/marcotorres/Documents/Documents - Marco’s MacBook Pro/perl';
use ventas;
use Data::Dumper;

sub new {
    my $self = bless({}, shift);

    return $self;
}

sub mercado {
    my ($self, $numero_de_mercado) = @_;
    my $datos;

    $ruta = "/Users/marcotorres/Documents/Documents - Marco’s MacBook Pro/perl";
    $nombre = 'clientes.txt';
    $filename = $ruta.'/'.$nombre;
    open($archivo,'<',$filename);

    while(<$archivo>){
        @linea = split(/,/ ,$_);
        if($linea[3] eq "mercado$numero_de_mercado"){
            my $ventas_datos = new ventas();
            my $datosv = $ventas_datos->totales_ventas($linea[0]);
            chomp($linea[4]);
            my $hash = {
                'numero' => $linea[0],
                'nombre' => $linea[1],
                'direccion' => $linea[2],
                'mercado' => $linea[3],
                'fecha' => $linea[4],
                'ventas_totales' => $datosv->{'total'},
                'agentes' => $datosv->{'agentes'},
                'servicios' => $datosv->{'servicios'},
                'ts' => $datosv->{'ts'}
            };
            print Dumper($hash);
            push(@{$datos},$hash);
        }
    }
    close $archivo;

    return $datos;
}

1;
