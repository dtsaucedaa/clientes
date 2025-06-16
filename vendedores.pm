package vendedores;

sub new {
    my $self = bless({}, shift);

    return $self;
}

sub agente {
    my ($self, $id_vendedor) = @_;
    my $nombre_agente = '';

    $ruta = "/Users/marcotorres/Documents/Documents - Marco’s MacBook Pro/perl";
    $nombre = 'vendedores.txt';
    $filename = $ruta.'/'.$nombre;
    open($archivo,'<',$filename);

    while(<$archivo>){
        @linea = split(/,/ ,$_);
        if($linea[0] == $id_vendedor){
            chomp($linea[1]);
            $nombre_agente = $linea[1];
        }
    }
    close $archivo;
    
    return $nombre_agente;
}

1;
