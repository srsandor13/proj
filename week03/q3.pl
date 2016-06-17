#!/user/bin/perl
#QUestion 3: Write a script to generate random DNA sequences of a given length.

#!/user/bin/perl

use strict;
use warnings;

my $file = "./q3_randomOutput";
open( my $OUT , '>' , $file ) or die( "Can't open this $file ($!)" );

my @list = ( 'A' , 'T' , 'C' , 'G' );

my $i = 0;

while ( $i < 25 ) {
        my $choice = int( rand @list );
                print "$list[$choice]";
                        print $OUT "$list[$choice]";
                                $i++;
                                }

