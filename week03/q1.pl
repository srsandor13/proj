#!/user/bin/perl
#Question 1: Write a script that uses nested loop constructs to print the multiplication tables up to 12

use strict;
use warnings;

my $file = "./q1_loopOutput";
open( my $OUT , '>' , $file ) or die( "Can't open this $file ($!)" );

for ( my $i = 1 ; $i <= 12 ; $i++ ) {
        for ( my $j = 1 ; $j <= 12 ; $j++ ) {
                my $m = $i * $j;
                print "$m ";
                print $OUT "$m ";
        }
        print "\n";
        print $OUT "\n";
}

