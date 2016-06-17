#!/user/bin/perl
#Question 4: Rewrite the script from the last question as a function, taking an argument for the length of the sequence that is returned. Write the function such that a second, optional argument, if provided, will cause the function to produce a sequence of a random length between 1 and the first argument.

use strict;
use warnings;

my $file = "./q4_argOutput";
open( my $OUT , '>' , $file ) or die( "Can't open this $file ($!)" );

print "What sequence length would you like? ";
my $input1 = <STDIN>;
chomp $input1;

print "Prompt length between 1 and $input1? Type 'yes'or press enter! ";
my $input2 = <STDIN>;

random( $input1, $input2 );

sub random{
        my ( @args ) = ( @_ );
        our $size = $args[0];
        my $random_length = $args[1];
        chomp $random_length;

        if ( $random_length eq "yes" ) {
                $size = int( rand $size ) + 1;
        }

        my @list = ( 'A' , 'T' , 'C' , 'G' );
        my $i = 0;
        while ( $i < $size ) {
                my $choice = int( rand @list );
                print "$list[$choice]";
                print $OUT "$list[$choice]";
                $i++;
        }
        print "\n";
	}

