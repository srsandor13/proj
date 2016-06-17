#!/user/bin/perl

#Question 5: Use the program from the previous problem to generate 10 random DNA sequences of at least 50 bases. Save them in 10 distinct files (don't forget to remove any header you added). Write a program that prints the names of the files that contain sequences that have at least one run of four identical bases in them.

use strict;
use warnings;

my $file = "./q5_Output";
open( my $RUN_OUT , '>' , $file ) or die( "Can't open $file ($!)" );

my $file_count_test = 1;

while ( $file_count_test <= 10 ) {

        my $file = "./seq".$file_count_test;
        open( my $OUT , '>' , $file ) or die( "Can't open $file ($!)" );
        my $length = 50 + int( rand( 100 - 50)) + 1;
        my $seq = random( $length, $OUT );
        my @run = ( "A" , "T" , "C" , "G" );
        foreach my $nucl ( @run ) {
                if ( $seq =~ /$nucl{4,}/ ) {
                        print "$nucl run found in $file\n";
                        print $RUN_OUT "$nucl run found in $file\n";
                }
        }
        $file_count_test++;
}


sub random{
        my ( @args ) = ( @_ );
        our $size = $args[0];
        my $output_File = $args[1];

        my @list = ( 'A' , 'T' , 'C' , 'G' );
        my $i = 0;
        my $sequence = '';
        while ( $i < $size ) {
                my $choice = int( rand @list );
                $sequence .=  $list[$choice];
                print $output_File "$list[$choice]";
                $i++;
        }
        return $sequence;
}


