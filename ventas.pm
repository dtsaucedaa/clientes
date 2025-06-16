package ventas;

use vendedores;
use Data::Dumper;
use servicios;

sub new {
    my $self = bless({}, shift);

    return $self;
}

sub totales_ventas {
    my ($self, $numero_de_cliente) = @_;
    my $total = 0;

    $ruta = "/Users/marcotorres/Documents/Documents - Marco’s MacBook Pro/perl";
    $nombre = 'ventas.txt';
    $filename = $ruta.'/'.$nombre;
    open($archivo,'<',$filename);
    my $agentes = {};
    my $services = {};
    my $existe = 0;
    my $t = 0;
    my $total_servicio = 0;
    my $ts = {};

    while(<$archivo>){
        $t = 0;
        @linea = split(/,/ ,$_);
        if($linea[0] == $numero_de_cliente){
            my $vendedores = new vendedores();
            my $nombre_vendedor = $vendedores->agente($linea[1]);
            chomp($linea[4]);
            my $servicios = new servicios();
            my $nombre_servicios = $servicios->datos($linea[4]);
            $services->{$nombre_servicios->{'nombre_servicio'}} = 1;
            $agentes->{$nombre_vendedor} = 1;
            $total = $total + $linea[3];

            foreach my $exiqueta(keys %{$ts}){
                $existe = 1;
                if ($etiqueta == $nombre_servicios->{'id_servicio'}){
                    my $suma = $linea[3] + $ts->{$nombre_servicios->{'id_servicio'}};
                    $total = $total + $suma;
                    $t = 1;
                }
            }
            if(!$existe || !$t){
                $ts->{$nombre_servicios->{'id_servicio'}} = { 
                    'nombre' => $nombre_servicios->{'nombre_servicio'},
                    'total' => $linea[3]
                };        
            }
            if($t){
                $ts->{$nombre_servicios->{'id_servicio'}} = {
                    'nombre' => $nombre_servicios->{'nombre_servicio'},
                    'total' => $total
                };   
                $total = 0;  
            }
        }
    }
    close $archivo;

    my $resultado = {
        'total' => $total,
        'agentes' => $agentes,
        'servicios' => $services,
        'ts' => $ts
    };

    return $resultado;
}


1;
