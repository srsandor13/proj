#!/user/bin/perl
#Question 2: Write the script from the previous question as a function that takes an argument for the size of the matrix.

use strict;
use warnings;

my $file = "./q2_matrixOutput";
open( my $OUT , '>' , $file ) or die( "Can't open this $file ($!)" );

print "What size is this matrix? ";
my $input = <STDIN>;

mult_table($input);

sub mult_table {
        my( $size ) = ( @_ );
        for ( my $i = 1 ; $i <= $size  ; $i++ ) {
                for ( my $j = 1 ; $j <= $size  ; $j++ ) {
                        my $m = $i * $j;
                        printf "$m ";
                        print $OUT "$m ";
                }
                print "\n";
                print $OUT "\n";
        }
}

