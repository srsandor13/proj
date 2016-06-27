#!/usr/bin/perl
use random_generator;

# Place the function from last week's "two argument" random DNA generation question into a module. The module should export the function.

=pod head 1 Description
package 'randomDNAgenerator is a function:
A sequence is to be returned and of a random length <1 basepair and returned length
=cut

my $file = "./q3_Output";
open( my $OUT , '>' , $file ) or die( "Can't open this $file ($!)" );

use strict;
use warnings;
  
my @bases = qw/ A C G T /;
my $length = 50;
  
sub random_sequence {
	my( $length , $random_length ) = @_;
  
    	if ( $random_length ) {
      		$length = int( rand( $length ));
     	}	
  
  	foreach ( 1 .. $length ) {
      		print $bases[int(rand(4))];
        }
    	print "\n";
  }
  
random_sequence( 50 );
random_sequence( 50 , 1 );

		 
#use it 
1;
