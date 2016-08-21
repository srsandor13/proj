#!/usr/bin/perl

package RandomProtein;
use Moose;

# Use OOP perl method to create object(s) that generate random protein sequences which are fixed or random length. 


has length => ( is => 'ro'; );

#subroutine that defines random proten sequences
sub random_protein_sequences{

        my ( @args ) = ( @_ );
        my $size = $args[0]->length;
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
                my $input = int( rand @aa );
                $protein .=  $aa[$input];
                $i++;
        }

        return $protein
}

