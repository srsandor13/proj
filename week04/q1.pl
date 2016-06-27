#!/usr/bin/perl
#Question1: Write a simple program with a hard-coded hash of arrays. The program should print out the hash of arrays when run


my $file = "./q1_HashArrayRun";
open( my $OUT , '>' , $file ) or die( "Can't open this $file ($!)" );

my %favorite_prints = (
        'Esoteric' => [ 'Mandala' , 'Nautilus Shell' , 'Tree of Life' ],
        'Art' => [ 'The Starry Night' , 'The Persistence of Memory' , 'The Scream' ],
        'Word' => [ 'Love' , 'Peace' , 'Eternity' ],
);

foreach my $type ( keys %favorite_prints ) {
        print "My favorite $type prints are: \n";
	print $OUT "My favorite $type prints are: \n";
        foreach(@{$favorite_prints{$type}}) {
		print "\t$_\n";
		print $OUT "$_";
        }
}
        print "\n";
        print $OUT "\n";
