#!/usr/bin/perl
package randomPROTEIN;

use strict;
use warnings;

# non-OOP perl function called random_protein that generates a random protein sequence of a fixed or random length

=pod

=head1 randomPROTEIN

randomPROTEIN function; arg[1] defines length of sequence (fixed or random) returned to user while arg[2] is random

=cut

#define length with use of subroutine
use Exporter 'import';
our @EXPORT_OK = ( "random_protein" );

#subroutine to define length
sub random_protein{

        my ( @args ) = ( @_ );
        my $size = $args[0];
        if ( scalar(@args) > 1 ) {
                my $random_length = $args[1];
                if ( $random_length eq "random" ) {
                        $size = int( rand $size ) + 1;
                }
        }

        my @aa = ( 'A' , 'C' , 'D' , 'E' , 'F' , 'G' , 'H' , 'I' , 'K' , 'L' , 'M' , 'N' , 'P' , 'Q' , 'R' , 'S' , 'T' , 'V' , 'W' , 'Y' );
        my $i = 0;
        my $protein = '';
        while ( $i < $size ) {
                my $choice = int( rand @aa );
                $protein .=  $aa_list[$choice];
                $i++;
        }
        print $protein;
        print "\n";
        return $protein
}

#use it
1;

