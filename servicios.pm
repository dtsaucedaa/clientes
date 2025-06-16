package servicios;

sub new {
    my $self = bless({}, shift);

    return $self;
}

sub datos {
    my ($self, $id_servicio) = @_;
    my $nombre_servicio = {};

    $ruta = "/Users/marcotorres/Documents/Documents - Marco’s MacBook Pro/perl";
    $nombre = 'servicios.txt';
    $filename = $ruta.'/'.$nombre;
    open($archivo,'<',$filename);

    while(<$archivo>){
        @linea = split(/,/ ,$_);
        if($linea[0] == $id_servicio){
            $nombre_servicio = {
                'id_servicio' => $linea[0],
                'nombre_servicio' => $linea[1]
            };
        }
    }
    close $archivo;
    return $nombre_servicio;
}

1;
